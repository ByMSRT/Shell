#!/bin/bash

while [ -z $reponse ] || [ $reponse != 'Merci' ]
do
        read -p 'Bienvenue : ' reponse
done
