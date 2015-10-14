#!/bin/bash

#En tête HTML
echo '<html lang="fr">'
echo '<head>'
echo '<meta charset="utf-8">'
echo '<title>Test Biere</title>'
echo '<link rel="stylesheet" href="style.css">'
echo '</head>'

#Compteur pour savoir si c'est la 1ére fois que l'on rentre dans la boucle
i=0
#Pour définir le comparateur
sep=';'
#Indique le numéro de la colonne a trier
col=1
#Trie la colonne qui posséde ce nom
chaine='Nom'

#Boucle pour connaitre les arguments
for j in $@
do
	case ${j} in
		-d?)
			sep=${j:2:1};
		;;
		-s*)
			col=${j:2};
		;;
		-S*)
		    chaine=${j:2};
		    col=$(head -n 1 | tr ";" "\n" | grep $chaine -n | cut -d: -f1);
		;;
	esac
done

echo "<table>"

#Tant que l'on peux lire une ligne dans le fichier passé en paramétre
(head -n 1 && tail -n +3 | sort -t$sep -k$col) | while read ligne
do
    if ((i==0))
    then
	echo '<tr><th>'$ligne'</th></tr>' | sed s/$sep/'<\/th><th>'/g
	i=$i+1;
    else
	echo '<tr><td>'$ligne'</td></tr>' | sed s/$sep/'<\/td><td>'/g  
    fi
done
echo "</table>"

echo '</html>'