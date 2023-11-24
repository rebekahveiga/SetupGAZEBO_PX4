# SetupGAZEBO_PX4
GAZEBO PX4 Setup (with ROS NOETIC UBUNTU 20.04)

Baixe o arquivo ROSPX4.sh

Abra um terminal e escreva:

cd Downloads/
chmod +x ROSPX4.sh
source ROSPX4.sh

Então siga os comandos abaixo:

cd ~
cd PX4-Autopilot/
make px4_sitl gazebo-classic

(Outros modelos para simulação podem ser encontrados no site oficial do PX4: https://docs.px4.io/main/en/sim_gazebo_classic/vehicles.html)
