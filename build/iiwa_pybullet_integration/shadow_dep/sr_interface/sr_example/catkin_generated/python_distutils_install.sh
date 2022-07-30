#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_example"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mamad/Demo/demo/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mamad/Demo/demo/install/lib/python2.7/dist-packages:/home/mamad/Demo/demo/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mamad/Demo/demo/build" \
    "/usr/bin/python2" \
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_example/setup.py" \
     \
    build --build-base "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_example" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/mamad/Demo/demo/install" --install-scripts="/home/mamad/Demo/demo/install/bin"
