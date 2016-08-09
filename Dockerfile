# Begin with a ROS baseline
FROM ros:indigo-ros-core

# Set bash as sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set up ROS workspace and clone sources
RUN cd && \
    mkdir -p catkin_ws/src && cd catkin_ws/src && \
    source /opt/ros/indigo/setup.bash && \
    catkin_init_workspace
ADD ./.rosinstall /root/catkin_ws/src/.rosinstall
RUN cd ~/catkin_ws/src && wstool up

