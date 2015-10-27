#!/bin/bash

#script qui remplace une partie du model (paramètre) par un corps (entrée stantard) et modifie le résultat final
read corps;

resultat=$(cat $1 | sed -n '1h;1!H;${;g;s/--DEBUT_REMPLACEMENT'.*'--FIN_REMPLACEMENT--/'"$corps"'/g;p;}');

while (echo $resultat | grep "\*" >2)
do
    resultat=$(echo $resultat | sed '${s/'"\*"'/'"<strong>"'/;s/'"\*"'/'"<\/strong>"'/;}');
done

while (echo $resultat | grep "\"" >2)
do
    resultat=$(echo $resultat | sed '${s/'"\""'/'"<em>"'/;s/'"\""'/'"<\/em>"'/;}');
done

echo $resultat;
