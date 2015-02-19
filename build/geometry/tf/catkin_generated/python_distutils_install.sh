#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/jay/ros/src/geometry/tf"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/jay/ros/install/lib/python2.7/dist-packages:/home/jay/ros/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/jay/ros/build" \
    "/usr/bin/python" \
    "/home/jay/ros/src/geometry/tf/setup.py" \
    build --build-base "/home/jay/ros/build/geometry/tf" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/jay/ros/install" --install-scripts="/home/jay/ros/install/bin"
