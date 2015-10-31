#!/bin/bash

#script qui remplace une partie du model (paramètre) par un corps (entrée stantard) et modifie le résultat final
read corps;

resultat=$(cat $1 | sed -n '1h;1!H;${;g;s/--DEBUT_REMPLACEMENT'.*'--FIN_REMPLACEMENT--/'"$corps"'/g;p;}');

while (echo -e $resultat | grep "\*" > /dev/null)
do
    resultat=$(echo -e $resultat | sed '${s/'"\*"'/'"<strong>"'/;s/'"\*"'/'"<\/strong>"'/;}');
done

while (echo -e $resultat | grep "\"" > /dev/null)
do
    resultat=$(echo -e $resultat | sed '${s/'"\""'/'"<em>"'/;s/'"\""'/'"<\/em>"'/;}');
done

echo -e $resultat;
