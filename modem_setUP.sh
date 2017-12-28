#!/bin/bash
sudo apt-get update
sudo apt-get install ppp wiringpi screen minicom
sudo cp ./boot/config.txt /boot/config.txt
sudo cp ./etc/ppp /etc -R

