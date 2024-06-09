FROM ros:humble

ENV DEBIAN_FRONTEND=noninteractive

# Update system
RUN apt-get update && apt-get upgrade -y

# ROS2
# install ros package
RUN apt-get update && apt-get install -y \
      ros-${ROS_DISTRO}-demo-nodes-cpp \
      ros-${ROS_DISTRO}-demo-nodes-py && \
    rm -rf /var/lib/apt/lists/*

# Gazebo Fortress
WORKDIR /opt/gazebo

# Install the necessary packages
RUN apt-get update && apt-get install -y \ 
    lsb-release \ 
    wget \ 
    gnupg \
    x11-apps \
    libxext-dev \
    libxrender-dev \
    libxtst-dev 

RUN sudo apt-get install -y ros-${ROS_DISTRO}-ros-gz

RUN mkdir -p /opt/gazebo
RUN export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:/opt/gazebo/description/models

# Configuring .bashrc
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

# Aditional software
RUN apt-get install -y vim tmux git less

# Create a workspace
WORKDIR /root/workdir

CMD [ "/bin/bash" ]
