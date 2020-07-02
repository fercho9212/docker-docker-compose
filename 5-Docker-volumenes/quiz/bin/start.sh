#!/bin/bash
sudo systemctl restart apache2
/usr/sbin/apache2ctl -D FOREGROUND

