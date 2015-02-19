#remember to create a docker package

__author__ = 'jay'
#credit to Usman Qayyum for providing help with the initial ros interfacing code


# !/usr/bin/env python

import os
import sys
import math
import roslib
roslib.load_manifest('roscopter')
import rospy
import roscopter.msg
import time
from sensor_msgs.msg import NavSatFix
from geometry_msgs.msg import TransformStamped
import tf
from threading import Thread
import AltitudeControl
from PyQt4 import QtCore, QtGui
import ControlPannel
import logging
from rigid_body import RigidBody

mavlink_dir = os.path.realpath(os.path.join(
    os.path.dirname(os.path.realpath(__file__)),
    'mavlink'))
sys.path.insert(0, mavlink_dir)

pymavlink_dir = os.path.join(mavlink_dir, 'pymavlink')
sys.path.insert(0, pymavlink_dir)

from pymavlink import mavutil


# the below is needed for the ui setup
try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s
try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)


#details the objects being tracked and how they are controlled
########################################################################################################################
class ControlSystem(Thread):

    # refresh rate of the controller
    control_rate = 100
    period = 1 / float(control_rate)

    # this controller has not yet been tested
    altitude_control = AltitudeControl.AltControl(period)

    #target position of the quadcopter being controlled, units:cm
    target_x = 0.0
    target_y = 0.0
    target_z = 0.0
    target_yaw = 0.0

    #land positions of quadcopter
    land_x = 0.0
    land_y = 0.0
    land_z = 0.0
    land_yaw = 0.0

    #take off and land commands
    takeoff_command = False
    land_command = False
    stabilize_command = False

    # the errors which the controllers will work upon
    throttle_direction_error = 0.0
    yaw_direction_error = 0.0
    pitch_direction_error = 0.0
    roll_direction_error = 0.0

    #pwm throttle settings and outputs
    pwm_throttle = 0.0
    max_throttle_pwm = 1948
    mid_throttle_pwm = 1500
    min_throttle_pwm = 1093
    throttle_control_setting = 0.0

    # initialising the thread subclass
    def __init__(self):
        Thread.__init__(self)

        #initialise log file
        self.log_file = open('logfile: '+time.strftime("%c"), 'w')
        self.log_file.write("Test\n")

    # this is the threaded function for this class, started by calling class.start()
    def run(self):

        try:
            print("Waiting")
            self.earliercmdtime = 0
            rospy.sleep(.1)

            # checks if a ROS core is operational
            while not rospy.is_shutdown():  # start loop

                # ensures the required rate of operation is met and updates the stored time
                if float(time.time()) - self.period >= self.earliercmdtime:
                    self.earliercmdtime = time.time()

                    #run the quad update loop iteration
                    quad1.run2()
                    #calls the main control algorithm
                    self.control_loop()

            rospy.spin()
        except rospy.ROSInterruptException:
            pass

    # main control algorithm
    def control_loop(self):

        # updates the quad position, call update functions below for added rigib bodies
        quad1.update_pos_values()

        # claculates the control errors, adjust for required errors
        self.calc_error(quad1.pos_x, quad1.pos_y, quad1.pos_z, quad1.yaw, self.target_x, self.target_y, self.target_z,
                        self.target_yaw)

        # checks if the prpogram is allowed to control the quadcopter
        if quad1.have_control:

            if self.takeoff_command:

                # resets controller after the quadcopter passes the altitude target
                if quad1.pos_z > self.target_z:
                    self.altitude_control.hover_throttle += self.altitude_control.accel_integral_z
                    self.altitude_control.reset_controller_z()
                    self.altitude_control.accel_integral_max_z = 100
                    self.stabilize_command = True
                    self.takeoff_command = False

                # calls experimental altitude controller, units:cm
                self.throttle_control_setting = self.altitude_control.update_z_controller(quad1.pos_z, quad1.old_pos_z,
                                                                                          controller.target_z)

            elif self.land_command:

                if ((quad1.pos_x < self.land_x + 10) and (quad1.pos_x > self.land_x - 10) and
                        (quad1.pos_y < self.land_y + 10) and (quad1.pos_y > self.land_y - 10)  and
                        (quad1.yaw < self.land_yaw + 5) and (quad1.yaw > self.land_yaw - 5)):
                    self.target_x = self.land_x
                    self.target_y = self.land_y
                    self.target_z = self.land_z
                    self.target_yaw = self.land_yaw

                    if quad1.pos_z < self.land_z + 5:
                        self.target_x = quad1.pos_x
                        self.target_y = quad1.pos_y
                        self.target_z = quad1.land_z
                        self.target_yaw = quad1.yaw

                else:
                    self.target_x = self.land_x
                    self.target_y = self.land_y
                    self.target_z = quad1.pos_z
                    self.target_yaw = self.land_yaw

                # calls experimental altitude controller, units:cm
                self.throttle_control_setting = self.altitude_control.update_z_controller(quad1.pos_z, quad1.old_pos_z,
                                                                                          controller.target_z)

            else:
                # calls experimental altitude controller, units:cm
                self.throttle_control_setting = self.altitude_control.update_z_controller(quad1.pos_z, quad1.old_pos_z,
                                                                                          controller.target_z)

            #convert control numbers to pwm periods
            throttle_pwm = self.calc_pwm_throttle(self.throttle_control_setting)
            #print time.time(), throttle_pwm, quad1.ch3

            #send off mavlink commands
            quad1.send_channel_pwm(0,0,throttle_pwm, 0)

            #writing position and targets to the log file
            self.log_file.write(str(time.time()) + ': Current Position (x, y, z, yaw): ' + str(quad1.pos_x)
                           + ', ' + str(quad1.pos_y) + ', ' + str(quad1.pos_y) + ', ' + str(quad1.yaw) +
                           "\n               Target Position  (x, y, z, yaw): " + str(self.target_x) + ', '
                           + str(self.target_y) + ', ' + str(self.target_z) + ', ' + str(self.target_yaw) + "\n")
        else:
            #writing position and targets to the log file
            self.log_file.write(str(time.time()) + ': Current Position (x, y, z, yaw): ' + str(quad1.pos_x)
                           + ', ' + str(quad1.pos_y) + ', ' + str(quad1.pos_y) + ', ' + str(quad1.yaw) +
                           "\n")
        # calls for the ui to be updated
        ui.update()


    # returns error in terms of roll, pitch, yaw and throttle direction distances
    def calc_error(self, x, y, z, yaw, target_x, target_y, target_z, target_yaw):

        # converts targets from tracking frame of reference to the quadcopter frame of reference
        self.roll_direction_error = math.cos(yaw) * (target_y - y) - math.sin(yaw) * (target_x - x)
        self.pitch_direction_error = math.sin(yaw) * (target_y - y) + math.cos(yaw) * (target_x - x)
        self.throttle_direction_error = target_z - z
        self.yaw_dirrection_error = target_yaw - yaw

    # converts a throttle setting into pwm that can be transmitted
    def calc_pwm_throttle(self, throttle_setting):

        # caps the throttle setting
        if throttle_setting > 1000:
            throttle_setting = 1000
        elif throttle_setting < 0:
            throttle_setting = 0

        # adjusts depending on the set throttle ranges - need to make some checks still
        if throttle_setting > 500:
            throttle_pwm_range = self.max_throttle_pwm - self.mid_throttle_pwm
            return self.mid_throttle_pwm + ((throttle_setting - 500) * throttle_pwm_range)/500
        else:
            throttle_pwm_range = self.mid_throttle_pwm - self.min_throttle_pwm
            return self.min_throttle_pwm + (throttle_setting * throttle_pwm_range)/500

    def reverse_pwm_throttle(self, pwm_setting):

        if pwm_setting > self.mid_throttle_pwm:
            throttle_pwm_range = self.max_throttle_pwm - self.mid_throttle_pwm
            return 500 + ((pwm_setting - self.mid_throttle_pwm)  * 500 / throttle_pwm_range)
        else:
            throttle_pwm_range = self.mid_throttle_pwm - self.min_throttle_pwm
            return (pwm_setting - self.min_throttle_pwm) * 500 / throttle_pwm_range

########################################################################################################################
class Quadcopter(Thread, RigidBody):

    # other static variables for the quadcopter
    device = "/dev/ttyUSB0"
    baud = 57600
    first_time_imu = True
    target_system = 0
    target_component = 0

    transmitter_control = True
    have_control = False

    #IMU values
    imu_roll = 0
    imu_pitch = 0
    imu_yaw = 0

    # quad channels that it recognizes
    ch1 = 0
    ch2 = 0
    ch3 = 0
    ch4 = 0
    ch5 = 0
    ch6 = 0
    ch7 = 0
    ch8 = 0

    def __init__(self, name, tracker):
        Thread.__init__(self)
        assert isinstance(name, object)
        self.name = name
        self.tracker = tracker

        self.send_odometry = TransformStamped()
        self.pub_odom = rospy.Publisher('/controller_send', TransformStamped)

        self.master = mavutil.mavlink_connection(self.device, self.baud)
        if self.device is None:
            print("You must specify a serial device")
            sys.exit(1)

        #device = "/dev/ttyACM0"
        #baud=11520

        self.pub_state = rospy.Publisher('state', roscopter.msg.State)
        self.pub_vfr_hud = rospy.Publisher('vfr_hud', roscopter.msg.VFR_HUD)
        self.pub_attitude = rospy.Publisher('attitude', roscopter.msg.Attitude)
        self.pub_raw_imu = rospy.Publisher('raw_imu', roscopter.msg.Mavlink_RAW_IMU)
        self.pub_gps = rospy.Publisher('gps', NavSatFix)
        self.pub_rc = rospy.Publisher('rc', roscopter.msg.RC)

        rospy.init_node('roscopter')
        rospy.Rate(100)
        rospy.Subscriber("/" + self.name + "/pose", TransformStamped, self.get_rigid_body)
        #wait for a heartbeat so we know the target system IDs
        print("Waiting for APM heartbeat...")
        self.master.wait_heartbeat()
        print("Heartbeat from APM (system %u component %u)" % (self.master.target_system, self.master.target_system))

        # requests data streams from the quadcopter over mavlink, options are stated in the function
        self.request_data_stream("rc_channels", 50, 1)
        # imu values
        self.request_data_stream("extra1", 50, 1)

    #same as the threaded function, just runs once
    def run2(self):
        # stores message from the quadcopter
        msg = self.master.recv_match(blocking=False)
        if msg:
            # stores the message type
            msg_type = msg.get_type()
            #print msg_type # debugging to check which data streams are operational

            # checks if the message contains information
            if msg.get_type() == "BAD_DATA":
                if mavutil.all_printable(msg.data):
                    sys.stdout.write(msg.data)
                    sys.stdout.flush()
            else:
                # add in new messages to monitor below
                if msg_type == "ATTITUDE":

                    # publishes information to the rostopic
                    self.pub_attitude.publish(msg.roll * 180 / 3.1415, msg.pitch * 180 / 3.1415,
                                              msg.yaw * 180 / 3.1415, msg.rollspeed, msg.pitchspeed, msg.yawspeed)

                    #upadtes imu values
                    self.imu_yaw = msg.yaw * 180 / 3.14159
                    self.imu_roll = msg.roll * 180 / 3.14159
                    self.imu_pitch = msg.pitch * 180 / 3.14159

                # updates the channel data
                elif msg_type == "RC_CHANNELS_RAW":
                    self.ch1 = msg.chan1_raw
                    self.ch2 = msg.chan2_raw
                    self.ch3 = msg.chan3_raw
                    self.ch4 = msg.chan4_raw
                    self.ch5 = msg.chan5_raw
                    self.ch6 = msg.chan6_raw
                    self.ch7 = msg.chan7_raw
                    self.ch8 = msg.chan8_raw

        #checks if channel 5 is below the threshold and gives back control to the transmitter
        if self.ch5 < 1400:
            if not self.transmitter_control:
                if self.have_control:

                    # informs via terminal
                    print "You no longer have control, Transmitter has taken over control"
                    self.transmitter_control = True
                    self.have_control = False

                    # changes the control message on the ui
                    ui.control_toggle_button.setText("Take Over Control")
                    self.disconnect_pwm_channels()
        else:
            # turns off transmitter control so that the program is able to take over when requested
            self.transmitter_control = False

    #takes in all messages from the quadcopter and interperates them
    def run(self):

        # continuous loop that monitors the information coming from the quadcopter
        while 1:

            # stores message from the quadcopter
            msg = self.master.recv_match(blocking=False)
            if msg:
                # stores the message type
                msg_type = msg.get_type()
                #print msg_type # debugging to check which data streams are operational

                # checks if the message contains information
                if msg.get_type() == "BAD_DATA":
                    if mavutil.all_printable(msg.data):
                        sys.stdout.write(msg.data)
                        sys.stdout.flush()
                else:
                    # add in new messages to monitor below
                    if msg_type == "ATTITUDE":

                        # publishes information to the rostopic
                        self.pub_attitude.publish(msg.roll * 180 / 3.1415, msg.pitch * 180 / 3.1415,
                                                  msg.yaw * 180 / 3.1415, msg.rollspeed, msg.pitchspeed, msg.yawspeed)

                        #upadtes imu values
                        self.imu_yaw = msg.yaw * 180 / 3.14159
                        self.imu_roll = msg.roll * 180 / 3.14159
                        self.imu_pitch = msg.pitch * 180 / 3.14159

                    # updates the channel data
                    elif msg_type == "RC_CHANNELS_RAW":
                        self.ch1 = msg.chan1_raw
                        self.ch2 = msg.chan2_raw
                        self.ch3 = msg.chan3_raw
                        self.ch4 = msg.chan4_raw
                        self.ch5 = msg.chan5_raw
                        self.ch6 = msg.chan6_raw
                        self.ch7 = msg.chan7_raw
                        self.ch8 = msg.chan8_raw


            #checks if channel 5 is below the threshold and gives back control to the transmitter
            if self.ch5 < 1400:
                if not self.transmitter_control:
                    if self.have_control:

                        # informs via terminal
                        print "You no longer have control, Transmitter has taken over control"
                        self.transmitter_control = True
                        self.have_control = False

                        # changes the control message on the ui
                        ui.control_toggle_button.setText("Take Over Control")
                        self.disconnect_pwm_channels()
            else:
                # turns off transmitter control so that the program is able to take over when requested
                self.transmitter_control = False
            time.sleep(0.01)

    # details the different types of messages able to be recieved from the quadcopter data stream
    def request_data_stream(self, request, frequency, on_off):
        # on_off of 1 turns on the data stream, value of 0 turns off

        system = self.master.target_system
        component = self.master.target_component
        send = mavutil.mavlink.MAV_DATA_STREAM_RC_CHANNELS

        # all data streams will be enabled
        if request == "all":
            send = mavutil.mavlink.MAV_DATA_STREAM_ALL
            send_true = True
        # servo_output_raw, rc_channels_raw
        elif request == "rc_channels":
            send = mavutil.mavlink.MAV_DATA_STREAM_RC_CHANNELS
            send_true = True
        # scaled_pressure, sensor_offsets, raw_imu
        elif request == "raw_sensor":
            send = mavutil.mavlink.MAV_DATA_STREAM_RAW_SENSORS
            send_true = True
        # meminfo, mission_current, mav_controller_output, sys_status
        elif request == "extended_status":
            send = mavutil.mavlink.MAV_DATA_STREAM_EXTENDED_STATUS
            send_true = True
        # gobal_position_int
        elif request == "stream_position":
            send = mavutil.mavlink.MAV_DATA_STREAM_POSITION
            send_true = True
        # attitude
        elif request == "extra1":
            send = mavutil.mavlink.MAV_DATA_STREAM_EXTRA1
            send_true = True
        # vrf_hud
        elif request == "extra2":
            send = mavutil.mavlink.MAV_DATA_STREAM_EXTRA2
            send_true = True
        # ahrs, hwstatus, system_time
        elif request == "extra3":
            send = mavutil.mavlink.MAV_DATA_STREAM_EXTRA3
            send_true = True
        else:
            send_true = False

        # checks if the requested data type is valid
        if send_true:
            # requests data stream from the autopilot
            self.master.mav.request_data_stream_send(system, component, send, frequency, on_off)

    # gives back control to the transmitter of all channels
    def disconnect_pwm_channels(self):
        self.send_channel_pwm(0, 0, 0, 0)

    # sends pwm to specified control channels, ch1-ch4, a setting of 0 gives back control to the transmitter
    def send_channel_pwm(self, roll, pitch, throttle, yaw):
        #throttle: high is up
        # yaw: high is yaw right
        #pitch: high is pitch up
        #roll: high is roll right

        # gathers the system and component ID's
        system = self.master.target_system
        component = self.master.target_component
        #sends off pwm commands
        self.master.mav.rc_channels_override_send(system, component, roll, pitch, throttle, yaw, 0, 0, 0, 0)

########################################################################################################################
class Ui_ControlPannel(ControlPannel.Ui_ControlPannel):

    # zero position used to make position requests easier for the user
    zero_x = 0
    zero_y = 0
    zero_z = 0
    zero_yaw = 0

    land_position_set = False
    landed = True

    # updates all fields in the ui
    def update(self):
        self.tracking_roll_box.setText(str(round(quad1.rigid_body_roll * 180 / 3.1419, 4)))
        self.tracking_pitch_box.setText(str(round(quad1.rigid_body_pitch * 180 / 3.1419, 4)))
        self.tracking_yaw_box.setText(str(round((quad1.rigid_body_yaw-self.zero_yaw) * 180 / 3.1419, 4)))
        self.tracking_x_position_box.setText(str(round(quad1.rigid_body_x-self.zero_x, 4)))
        self.tracking_y_position_box.setText(str(round(quad1.rigid_body_y-self.zero_y, 4)))
        self.tracking_z_position_box.setText(str(round(quad1.rigid_body_z-self.zero_z, 4)))
        self.imu_roll_box.setText(str(round(quad1.imu_roll, 4)))
        self.imu_pitch_box.setText(str(round(quad1.imu_pitch, 4)))
        self.imu_yaw_box.setText(str(round(quad1.imu_yaw, 4)))
        self.ch_box_1.setText(str(round(quad1.ch1, 4)))
        self.ch_box_2.setText(str(round(quad1.ch2, 4)))
        self.ch_box_3.setText(str(round(quad1.ch3, 4)))
        self.ch_box_4.setText(str(round(quad1.ch4, 4)))    #self.quad1.ch5, 4)))
        self.ch_box_5.setText(str(round(quad1.ch5, 4)))
        self.ch_box_6.setText(str(round(quad1.ch6, 4)))
        self.ch_box_7.setText(str(round(quad1.ch7, 4)))
        self.ch_box_8.setText(str(round(quad1.ch8, 4)))

        # debugging boxes
        self.box_1.setText(str(round(controller.altitude_control.p_effort_z, 4)))
        self.box_2.setText(str(round(controller.altitude_control.i_effort_z, 4)))
        self.box_3.setText(str(round(controller.altitude_control.d_effort_z, 4)))
        self.box_4.setText(str(round(controller.altitude_control.desired_accel_z, 4)))
        self.box_5.setText(str(round(controller.altitude_control.vel_target_z, 4)))
        self.box_6.setText(str(round(controller.altitude_control.pos_target_z, 4)))
        self.box_7.setText(str(round(controller.pitch_direction_error, 4)))
        self.box_8.setText(str(round(controller.roll_direction_error, 4)))
        self.box_9.setText(str(round(controller.target_x, 4)))
        self.box_10.setText(str(round(controller.target_y, 4)))
        self.box_11.setText(str(round(quad1.pos_x, 4)))
        self.box_12.setText(str(round(quad1.pos_y, 4)))

        if quad1.have_control and not controller.takeoff_command and not controller.land_command:
            if (quad1.pos_z < controller.land_z + 5):
                self.take_off_land_button.setText("Take off")
                self.landed = True
            else:
                self.take_off_land_button.setText("Land")
                ui.landed = False


    # initialises the call backs from the ui
    def setup(self):
        QtCore.QObject.connect(self.set_home_position_button, QtCore.SIGNAL(_fromUtf8("clicked()")), self.set_zero_position)
        QtCore.QObject.connect(self.set_home_orientation_button, QtCore.SIGNAL(_fromUtf8("clicked()")), self.set_zero_orientation)
        QtCore.QObject.connect(self.goto_position_button, QtCore.SIGNAL(_fromUtf8("clicked()")), self.goto_position)
        QtCore.QObject.connect(self.control_toggle_button, QtCore.SIGNAL(_fromUtf8("clicked()")), self.control_toggle)
        QtCore.QObject.connect(self.set_land_position_button, QtCore.SIGNAL(_fromUtf8("clicked()")), self.set_land_position)
        QtCore.QObject.connect(self.take_off_land_button, QtCore.SIGNAL(_fromUtf8("clicked()")), self.take_off_land)
       # QtCore.QObject.connect(self.set_PID_coefficients_button, QtCore.SIGNAL(_fromUtf8("clicked()")), self.set_PID_coefficients)

    def take_off_land(self):
        if self.land_position_set:
            if quad1.have_control:
                if self.landed:
                    controller.altitude_control.accel_integral_max_z = 600
                    controller.stabilize_command = False
                    controller.land_command = False
                    controller.takeoff_command = True
                    controller.target_x = controller.land_x
                    controller.target_y = controller.land_y
                    controller.target_z = controller.land_z + 100
                    controller.target_yaw = controller.land_yaw
                    self.take_off_land_button.setText("Land")

                    # informs the user of the updated target position and orientation via the terminal
                    print "Taking off to 100cm"
                else:
                    controller.altitude_control.accel_integral_max_z = 100
                    controller.stabilize_command = False
                    controller.takeoff_command = False
                    controller.land_command = True
                    self.take_off_land_button.setText("Takeoff")
                    print "Landing"
            else:
                print"Please take over control first"
        else:
            print "Please set the land position"


    #sets the land position before taking off is enabled
    def set_land_position(self):
        controller.land_x = quad1.pos_x
        controller.land_y = quad1.pos_y
        controller.land_z = quad1.pos_z
        controller.land_yaw = quad1.yaw
        self.land_position_set = True

        print"Land position is now x:", controller.land_x, " y:", controller.land_y, " z:", controller.land_z

    # toggles between computer control and transmitter control of the quadcopter
    def control_toggle(self):

        # checks if the transmitter has allowed computer control
        if not quad1.transmitter_control:

            # checks if the computer already has control
            if quad1.have_control:

                # gives back control and updates the text on the control button
                quad1.have_control = False
                self.control_toggle_button.setText("Take Over Control")
                print"You no longer have control"
                # quad1.disconnect_pwm_channels() # used to enable transmitter control

            else:
                #changing the take off land button to appropriate text
                if quad1.pos_z > (controller.land_z + 10):
                    self.take_off_land_button.setText("Land")
                    self.landed = False
                else:
                    self.take_off_land_button.setText("Take off")
                    self.landed = True

                #converting the current users throttle output to set the hover throttle
                controller.altitude_control.hover_throttle = controller.reverse_pwm_throttle(quad1.ch3)
                controller.altitude_control.reset_controller_z()

                #takes over control and updates the text on the control button
                quad1.have_control = True
                self.control_toggle_button.setText("Give Back Control")

                # sets target as the current position to stabilise around and informs the user via the terminal
                controller.target_x = quad1.pos_x
                controller.target_y = quad1.pos_y
                controller.target_z = quad1.pos_z
                print controller.target_z
                controller.target_yaw = quad1.yaw
                print"You now have control, stabilizing about x:", controller.target_x, " y:", controller.target_y, \
                    " z:", controller.target_z, " yaw: ", controller.target_yaw

                #turns on the right controller
                controller.altitude_control.accel_integral_max_z = 100
                controller.takeoff_command = False
                controller.land_command = False
                controller.stabilize_command = True

        # doesnt allow control toggle if the transmitter has not enabled computer control
        else:
            # ensures the computer doensnt have control and informs the user via the terminal
            quad1.have_control = False
            print"You cannot take control transmitter has control, please switch channel 5 before trying to take over"

    # sets the zero position
    def set_zero_position(self):

        # defines the zero reference position as the quadcopters current position
        self.zero_x = quad1.rigid_body_x
        self.zero_y = quad1.rigid_body_y
        self.zero_z = quad1.rigid_body_z

        # informs the user of the updated zero position in the tracking reference frame via the terminal
        print"Zero position is now x:", self.zero_x, " y:", self.zero_y, " z:", self.zero_z

    # sets the zero orientation
    def set_zero_orientation(self):

        # defines the zero reference orientation as the quadcopters current orientation
        self.zero_yaw = quad1.rigid_body_yaw

        # informs the user of the updated zero orientation in the tracking reference frame via the terminal
        print"Zero orientaton is now yaw:", quad1.rigid_body_yaw

    # sets the target positions
    def goto_position(self):

        # sets the target positions from the users input positions
        controller.target_x = self.zero_x + float(self.goto_x_position_box.text())
        controller.target_y = self.zero_y + float(self.goto_y_position_box.text())
        controller.target_z = self.zero_z + float(self.goto_z_position_box.text())
        controller.target_yaw = self.zero_yaw + float(self.goto_yaw_box.text())

        # informs the user of the updated target position and orientation via the terminal
        print"Going to x:", controller.target_x, " y:", controller.target_y, " z:", controller.target_z, " yaw:", \
            controller.target_yaw


# sets up the GUI
import sys
app = QtGui.QApplication(sys.argv)
ControlPannel = QtGui.QMainWindow()
ui = Ui_ControlPannel()
ui.setupUi(ControlPannel)
ui.setup()
ControlPannel.show()

if __name__ == "__main__":

    # initialises the quadcopter
    quad1 = Quadcopter("Quad1", "Vicon")

    # initialises the control system
    controller = ControlSystem()

    # sets the threaded functions in the classes as daemons, so they close when the parent thread closes (the ui)
    quad1.daemon = True
    controller.daemon = True

    # starts the threaded functions
    #quad1.start()
    controller.start()
    sys.exit(app.exec_())


