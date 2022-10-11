# Filtrage par motifs (*pattern-matching*) sur les entiers

On fournit la fonction `bissextile`, prenant en argument une année et
retournant un booléen indiquant si l’année est bissextile ou non
(année bissextile ⇔ divisible par 4 et non divisible par 100, à moins
qu’elle soit divisible par 400).

Écrire la fonction `nbjour` de type `int -> int -> int`, prenant en
argument un numéro de mois (entier entre `1` et `12`, on levèra une
exception en cas de mois invalide) et une année, et renvoyant le
nombre de jours de ce mois dans cette année-là.
