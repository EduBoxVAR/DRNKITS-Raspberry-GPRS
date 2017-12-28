
#! /bin/bash

sudo gpio mode 1 out
sudo gpio mode 6 out
sudo gpio write 6 1
sudo gpio write 1 1
sudo gpio write 6 0
sleep 3
sudo gpio write 6 1

