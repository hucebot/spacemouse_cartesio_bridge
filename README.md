# spacemouse_cartesio_bridge

This package containes a simple Python node for ROS noetic that interfaces [CartesI/O](https://github.com/ADVRHumanoids/CartesianInterface) with SpaceMouse device.

## Installation

Follow the installation steps for the [spacenav_node](<http://wiki.ros.org/spacenav_node>) ROS package:

```bash
sudo apt install spacenavd
sudo apt install ros-noetic-spacenav-node
```

Also install the Python library [pynput](https://github.com/moses-palmer/pynput):

```bash
pip install pynput
```

## Node Parameters

- **joy_topic** (string): SpaceMouse output topic of type `sensor_msgs.msg.Joy` (default: "spacenav/joy")
- **tf_prefix** (string): CartesI/O `tf_prefix` in use (default: "ci")
- **deadband** (double): Set to zero axes values below `deadband` (default: 0.4)
- **lin_scale** (double): Multiply linear axes values by `lin_scale` before seding velocity references (default: 1.0)
- **ang_scale** (double): Multiply angular axes values by `ang_scale` before seding velocity references (default: 1.0)
- **possible_tasks** (list(string)): List of the names of the Cartesian tasks we want to control (NO default, **must be set**)

## Launching

After starting a CartesI/O environment. On a separate terminal, run:

```bash
spacenavd
roslaunch spacemouse_cartesio_bridge start.launch
```

Modify the parameter setting in the `start.launch` file according to your application.

## Usage

- Select the desired task to control by pressing the 'Enter' button on your keyboard (it will scroll throughout the tasks defined in the **possible_tasks**) param.
- Activate the 'Velocity Control Mode' for the selected task by pressing the left button on the SpaceMouse. NOTE: You can control the robot through the SpaceMouse only in 'Velocity Control Mode'.
- Set the reference frame for the velocity reference to either GLOBAL ("world") or LOCAL (the controller frame) by pressing the right button on the SpaceMouse

## Try out on Docker

You can try the SpaceMouse CartesI/O bridge on a docker example with a simulated Tiago Dual (omnibase) developed by PAL Robotics (CartesI/O configuration at the link: (<https://github.com/hucebot/tiago_dual_cartesio_config>)).

To build the docker image, from the **spacemouse_cartesio_bridge/docker** folder, run:

```bash
docker build -t opensot_spacemouse .
```

To run the container, form the **spacemouse_cartesio_bridge/docker** folder, run:

```bash
bash run_docker.sh
```

Then run:

```bash
spacenavd
terminator
```

Inside the `terminator`, open two terminal. In one run:

```bash
roslaunch tiago_dual_cartesio_config cartesio.launch
```

And in the second, run:

```bash
roslaunch spacemouse_cartesio_bridge start.launch
```
