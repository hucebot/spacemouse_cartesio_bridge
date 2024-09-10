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
            --name opensot \
            --hostname opensot \
            --add-host opensot:127.0.0.1 \
            opensot_spacemouse
            
