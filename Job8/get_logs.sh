#!/bin/bash

file=number_connection-$(date +%Y-%m-%d-'%H:%M')
/var/log/auth.log | grep "$USER" | wc -l > $file
tar -cvf ./$file.tar ./ && mv $file.tar Backup
