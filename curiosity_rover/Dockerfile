FROM osrf/space-ros:jazzy-2025.04.0

ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
ENV ROS_DISTRO=jazzy
ENV HOME=/home/spaceros-user

# Update the ROS package keys
ADD --chmod=644 https://raw.githubusercontent.com/ros/rosdistro/master/ros.key /usr/share/keyrings/ros-archive-keyring.gpg

# Install dependencies
# Related to space-ros/space-ros#195
RUN sudo apt update && \
    sudo apt install -y \
      ros-${ROS_DISTRO}-control-msgs \
      ros-${ROS_DISTRO}-rmw-cyclonedds-cpp

# Prepare the workspace
SHELL ["bash", "-c"]
RUN mkdir -p ${HOME}/curiosity_ws/src
WORKDIR ${HOME}/curiosity_ws

COPY ./curiosity_rover_demo src/curiosity_rover_demo
COPY .defaults.yaml .defaults.yaml

# Build the workspace
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
    && source "${SPACEROS_DIR}"/install/setup.bash \
    && colcon build --symlink-install

# Source the workspace
RUN echo "source ${HOME}/curiosity_ws/install/setup.bash" >> ${HOME}/.bashrc
