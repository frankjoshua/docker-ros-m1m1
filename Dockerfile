FROM ros:kinetic-robot

RUN sudo apt update &&\
    sudo apt install wget

ENV DOWNLOAD_URL https://download.slamtec.com/api/download/slamware-ros-sdk/2.6.0
ENV FILE_NAME slametec.tar.bz2
ENV CATKIN_WS /catkin_ws

RUN mkdir -p $CATKIN_WS/src

RUN wget -O /tmp/$FILE_NAME $DOWNLOAD_URL &&\
    cd /tmp &&\
    tar -vxjf $FILE_NAME &&\
    mv /tmp/slamware_ros_sdk_linux-x86_64-gcc5.4/src $CATKIN_WS &&\
    rm -r /tmp/*

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash" &&\
    cd $CATKIN_WS &&\
    /bin/bash -c "source /opt/ros/kinetic/setup.bash && catkin_make install"

RUN echo "source \"${CATKIN_WS}/devel/setup.bash\"" >> /opt/ros/kinetic/setup.bash

ENV LASER_IP 192.168.11.1
CMD ["bash", "-c", "roslaunch slamware_ros_sdk slamware_ros_sdk_server_node.launch ip_address:=${LASER_IP}"]