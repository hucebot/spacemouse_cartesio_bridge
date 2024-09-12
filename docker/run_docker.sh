# For graphics
xhost +

docker run \
            --interactive \
            --tty \
            --rm \
            --env DISPLAY=$DISPLAY \
            --net host \
            --privileged \
            --volume /tmp/.X11-unix:/tmp/.X11-unix \
            --name opensot_spacemouse \
            --volume ${HOME}/Workspace/spacemouse_cartesio_bridge/scripts/bridge_node:/home/forest_ws/src/spacemouse_cartesio_bridge/scripts/bridge_node \
            opensot_spacemouse
