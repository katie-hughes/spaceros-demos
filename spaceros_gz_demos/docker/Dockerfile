FROM osrf/space-ros:latest

# https://gazebosim.org/docs/harmonic/install_ubuntu/#binary-installation-on-ubuntu
RUN sudo apt-get update
RUN sudo apt-get install lsb-release gnupg
RUN sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN sudo apt-get update
RUN yes | sudo apt-get install gz-harmonic

RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        bash \
        bash-completion \
        build-essential \
        cmake \
        git \
        python-is-python3 \
        python3-pip \
        ripgrep \
        ros-humble-rviz2 \
        ros-humble-ros-gzharmonic \
    && sudo apt-get autoremove -y 

    # Replace old entrypoint with current entrypoint that extends upon it
RUN sudo mv /ros_entrypoint.sh /old_entrypoint.sh
COPY entrypoint.sh /ros_entrypoint.sh
RUN sudo chmod +x /ros_entrypoint.sh

RUN mkdir -p /home/spaceros-user/spaceros/ws/src/spaceros_gz_demos
WORKDIR /home/spaceros-user/spaceros/ws
