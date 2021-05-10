#!/bin/bash
sudo ip link add eth_dummy type dummy
sudo ip addr add 10.202.0.1/24 dev eth_dummy
sudo ip link set eth_dummy up
sudo systemctl stop firmwared.service 
sudo systemctl start firmwared.service

sphinx /opt/parrot-sphinx/usr/share/sphinx/drones/bebop2.drone::with_front_cam=false::stolen_interface=eth_dummy:eth0:10.202.0.1/24
