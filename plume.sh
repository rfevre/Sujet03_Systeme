#!/bin/bash
continue=true

function arret {
    echo $line | egrep 'exit';
    continue=false
}

function affichage {
    echo $line | egrep '^GET' && echo '(HTTP/1.0,200,"OK")'
}

while $continue
do
    read line
    echo $continue
    echo $line | affichage && arret; echo "reçu";
done





