#!/bin/bash
#author: Jay Mills 19/02/2015
#installs ROS environment, as well as the quadcopter control program and dependancies
#down near bottom change file path once name is decided upon


#checks ubuntu version number
for ((i=1;; i++)); do
    read "d$i" || break;
done < /etc/lsb-release
release_number=$d2
echo $release_number

#installs ROS
if [ "$release_number" == "DISTRIB_RELEASE=14.04" ]
then
	echo "installing ROS Indigo"
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
	wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install ros-indigo-desktop-full
	sudo rosdep init
	rosdep update
	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	source ~/.bashrc
	sudo apt-get install python-rosinstall	
elif [ "$release_number" == "DISTRIB_RELEASE=13.10" ]
then
	echo "installing ROS Indigo"
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu saucy main" > /etc/apt/sources.list.d/ros-latest.list'
	wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install ros-indigo-desktop-full
	sudo rosdep init
	rosdep update
	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	source ~/.bashrc
	sudo apt-get install python-rosinstall
fi

#download folder from github
#catkin make


#downloading and installing python
wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz
tar -xzf Python-2.7.6.tgz 
cd Python-2.7.6
./configure 
make
sudo make install
cd ..
rm -f Python-2.7.6.tgz
rm -rf Python-2.7.6

#installing dependancies
sudo rosdep init
rosdep update
cd ros/src/roscopter
rosdep install roscopter

cd Quadcopter_Controller
source /opt/ros/indigo/setup.bash
catkin_make
source devel/setup.bash

#download and install UI environment and python ui compiler
wget http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.2/PyQt-x11-gpl-4.11.2.tar.gz
tar -zxvf PyQt-x11-gpl-4.11.2.tar.gz
timestamp "Installing PyQt"
cd ../PyQt-x11-gpl-4.11.2/
sudo sed -i 's/resp = sys.stdin.readline()/resp = "yes"/g' configure-ng.py
python configure-ng.py
make
make install
rm -f PyQt-x11-gpl-4.11.2.tar.gz
rm -rf PyQt-x11-gpl-4.11.2


