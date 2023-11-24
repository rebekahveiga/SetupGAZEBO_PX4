#!/bin/bash

# Clonar o repositório PX4-Autopilot
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
cd PX4-Autopilot
bash ./Tools/Setup.ubuntu.sh

# Instalar dependências do sistema
sudo apt-get install protobuf-compiler libeigen3-dev libopencv-dev -y

# Instalar dependências ROS para MavROS
sudo apt-get install ros-${ROS_DISTRO}-mavros ros-${ROS_DISTRO}-mavros-extras ros-${ROS_DISTRO}-mavros-msgs

# Instalar datasets geográficos para MavROS
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh

# Criar um Catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
wstool init src
sudo pip3 install -U catkin_tools

# Configurar o workspace e instalar dependências
rosinstall_generator --rosdistro noetic mavlink --deps | tee /tmp/mavros.rosinstall
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4
rosdep install --from-paths src --ignore-src -y

# Compilar o Catkin workspace
catkin build

# Retornar ao diretório inicial
cd ~

# Adicionar comandos adicionais conforme necessário

echo "Configuração concluída!"

