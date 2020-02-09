#!/bin/bash

resp="s"

echo "##################################### script do ambiente px4 ##################################"
cat ./carcara.txt
mkdir ~/projetos
cd ~/projetos

sleep 1
echo  .
sleep 1
echo  .
sleep 1
echo  .

echo  "criando arquivo de log..."
touch log.txt
echo "inicia log.............." >> log.txt
echo "atualizando repositorios..." >> log.txt

apt update

echo "##################"
echo "##################"
echo "##################"

echo "atualizando pacotes..."

apt -y upgrade

echo "instalando pacotes essenciais..." >> ./log.txt

apt -y install htop tree git net-tools rsync tcpdump netcat locate sudo terminator openssh-client openssh-server

echo "instalação do qground control" >> ./log.txt

usermod -a -G dialout $USER
apt-get remove modemmanager -y
apt -y install gstreamer1.0-plugins-bad gstreamer1.0-libav
wget https://s3-us-west-2.amazonaws.com/qgroundcontrol/latest/QGroundControl.AppImage
chmod +x ./QGroundControl.AppImage


echo "##################"
echo "##################"
echo "##################"

echo "clonando repositorio px4..." >> ./log.txt
git clone https://github.com/PX4/Firmware.git
echo "executando script do repo...(vai demorar uns minutos...)" >> ./log.txt
chmod a+x ~/projetos/Firmware/Tools/setup/ubuntu.sh
~/projetos/Firmware/Tools/setup/ubuntu.sh
echo "########################################"
echo "instalacao finalizada! CarcaDrones!" >> ./log.txt

