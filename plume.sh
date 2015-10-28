#!/bin/bash

#Tant que la ressource demandée n'est pas égal à "exit" on continue
while [ "$methode" != "GET" ] || [ "$ressource" != "exit" ]
do
    #On lit la ligne et on enregistre dans methode et ressource les valeurs correspondante
    read methode ressource;
    echo "reçu";
    #Si la methode est égale à "GET" c'est OK
    if [ "$methode" == "GET" ]
    then
	echo '(HTTP/1.0,200,"OK")';
	echo "ressource = " $ressource;
    #Sinon erreur
    else
	echo '(HTTP/1.0,405,"Method Not Allowed")';
    fi
done

