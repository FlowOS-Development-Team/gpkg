#!/bin/bash
sudo mkdir /etc/gpkg
sudo mkdir /usr/pkg
sudo mkdir /etc/update.d
sudo cp env.sh /etc/gpkg/env.sh
sudo cp gpadd.sh /usr/bin/gpadd
sudo chmod +x /usr/bin/gpadd
sudo cp gprm.sh /usr/bin/gprm
sudo chmod +x /usr/bin/gprm
sudo cp gpupdate.sh /usr/bin/gpupdate
sudo chmod +x /usr/bin/gpupdate
