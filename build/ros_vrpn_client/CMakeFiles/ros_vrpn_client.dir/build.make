# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jay/ros/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jay/ros/build

# Include any dependencies generated for this target.
include ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/depend.make

# Include the progress variables for this target.
include ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/progress.make

# Include the compile flags for this target's objects.
include ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o: /home/jay/ros/src/ros_vrpn_client/src/ros_vrpn_client.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jay/ros/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o -c /home/jay/ros/src/ros_vrpn_client/src/ros_vrpn_client.cpp

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.i"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jay/ros/src/ros_vrpn_client/src/ros_vrpn_client.cpp > CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.i

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.s"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jay/ros/src/ros_vrpn_client/src/ros_vrpn_client.cpp -o CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.s

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.requires:
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.provides: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.requires
	$(MAKE) -f ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.provides.build
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.provides

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.provides.build: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o: /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Connection.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jay/ros/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o -c /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Connection.C

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.i"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Connection.C > CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.i

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.s"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Connection.C -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.s

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.requires:
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.provides: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.requires
	$(MAKE) -f ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.provides.build
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.provides

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.provides.build: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o: /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Tracker.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jay/ros/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o -c /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Tracker.C

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.i"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Tracker.C > CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.i

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.s"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Tracker.C -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.s

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.requires:
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.provides: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.requires
	$(MAKE) -f ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.provides.build
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.provides

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.provides.build: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o: /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Shared.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jay/ros/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o -c /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Shared.C

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.i"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Shared.C > CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.i

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.s"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Shared.C -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.s

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.requires:
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.provides: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.requires
	$(MAKE) -f ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.provides.build
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.provides

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.provides.build: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o: /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_FileConnection.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jay/ros/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o -c /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_FileConnection.C

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.i"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_FileConnection.C > CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.i

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.s"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_FileConnection.C -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.s

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.requires:
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.provides: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.requires
	$(MAKE) -f ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.provides.build
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.provides

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.provides.build: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o: /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_BaseClass.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jay/ros/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o -c /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_BaseClass.C

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.i"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_BaseClass.C > CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.i

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.s"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_BaseClass.C -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.s

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.requires:
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.provides: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.requires
	$(MAKE) -f ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.provides.build
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.provides

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.provides.build: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/flags.make
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o: /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Serial.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jay/ros/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o -c /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Serial.C

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.i"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Serial.C > CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.i

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.s"
	cd /home/jay/ros/build/ros_vrpn_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jay/ros/src/ros_vrpn_client/vrpn/vrpn_Serial.C -o CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.s

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.requires:
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.provides: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.requires
	$(MAKE) -f ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.provides.build
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.provides

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.provides.build: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o

# Object files for target ros_vrpn_client
ros_vrpn_client_OBJECTS = \
"CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o" \
"CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o" \
"CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o" \
"CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o" \
"CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o" \
"CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o" \
"CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o"

# External object files for target ros_vrpn_client
ros_vrpn_client_EXTERNAL_OBJECTS =

/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build.make
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /home/jay/ros/devel/lib/libtf.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libtf2_ros.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libactionlib.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libmessage_filters.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libroscpp.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libtf2.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/librosconsole.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/liblog4cxx.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/librostime.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /opt/ros/indigo/lib/libcpp_common.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client"
	cd /home/jay/ros/build/ros_vrpn_client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ros_vrpn_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build: /home/jay/ros/devel/lib/ros_vrpn_client/ros_vrpn_client
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/build

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/src/ros_vrpn_client.cpp.o.requires
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Connection.C.o.requires
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Tracker.C.o.requires
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Shared.C.o.requires
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_FileConnection.C.o.requires
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_BaseClass.C.o.requires
ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires: ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/vrpn/vrpn_Serial.C.o.requires
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/requires

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/clean:
	cd /home/jay/ros/build/ros_vrpn_client && $(CMAKE_COMMAND) -P CMakeFiles/ros_vrpn_client.dir/cmake_clean.cmake
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/clean

ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/depend:
	cd /home/jay/ros/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jay/ros/src /home/jay/ros/src/ros_vrpn_client /home/jay/ros/build /home/jay/ros/build/ros_vrpn_client /home/jay/ros/build/ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ros_vrpn_client/CMakeFiles/ros_vrpn_client.dir/depend

