#!/bin/bash

sed 1d Shell_Userlist.csv | while IFS=, read -r Id Prenom Nom Mdp Role || [ -n "$Role" ];
do
    username=$Prenom$Nom
    cleanusername=$(echo "${username}" | tr -d '[:space:]')
    sudo useradd -p $(openssl passwd -1 $Mdp) $cleanusername
    if [[ $Role == A* ]]; then
        sudo usermod -aG sudo $cleanusername
    fi
done
