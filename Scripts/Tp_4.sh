#!/bin/sh
#annuaire

# Fonction ajouter un contact
add() {
echo "AJOUTER UN NOUVEAU CONTACT"
echo "NOM : \c"
read nom
echo "NUMERO DE TELEPHONE : \c"
read telephone
echo "ADDRESSE EMAIL : \c"
read email
echo "$nom : $telephone ($email)" >> annuaire.txt
}

# Fonction modifier un contact (numéro & mail)
modif() {
echo "MODIFIER LE NUMERO DE TELEPHONE D'UN CONTACT & L'ADRESSE EMAIL"
echo "NOM ? \c"
read nom
if grep "^$nom" annuaire.txt
then
   echo "NOUVEAU NUMERO DE TELEPHONE ? \c"
   read telephone
   echo "NOUVEL ADRESSE EMAIL ? \c"
   read email
   grep -v "^$nom" annuaire.txt > buffer
   echo "$nom : $telephone ($email)" >> buffer
   mv buffer annuaire.txt
fi 
}

# Fonction supprimer un contact
supp() {
echo "SUPPRESSION D'UN CORRESPONDANT"
echo "NOM ? \c"
read nom
grep -v "$nom" annuaire.txt > buffer
mv buffer annuaire.txt
}

# Fonction Afficher la liste
list() {
echo "\nANNUAIRE : \n"
sort annuaire.txt 
}

# Fonction chercher un contact (via le nom)
search() {
echo "RECHERCHER DANS L'ANNUAIRE (Par le nom)"
echo "NOM ? \c"
read nom
grep "$nom" annuaire.txt
}

# Fonction chercher un contact (via le numéro)
search1() {
echo "RECHERCHER DANS L'ANNUAIRE (Par le numéro)"
echo "NUMERO ? \c"
read telephone
grep "$telephone" annuaire.txt
}

# Fonction chercher un contact (Par l'adresse email)
search2() {
echo "RECHERCHER DANS L'ANNUAIRE (Par email)"
echo "EMAIL ? \c"
read email
grep "$email" annuaire.txt
}


attente(){
echo "\nAPPUYER SUR UNE TOUCHE POUR REVENIR AU MENU \c"
read bouton
}

#-------------------------------------------------------
#Menu :

while :
do

echo "\n+-----------------------------+"
echo "| Bienvenue dans l'annuaire ! |"
echo "+-----------------------------+"

echo "\n1- AJOUTER UN NOUVEAU CONTACT"

echo "\n2- RECHERCHER DANS L'ANNUAIRE (Par le nom)"

echo "\n3- RECHERCHER DANS L'ANNUAIRE (Par le numéro)"

echo "\n4- RECHERCHER DANS L'ANNUAIRE (Par email)"

echo "\n5- SUPPRESSION D'UN CONTACT"

echo "\n6- MODIFIER LE NUMERO DE TELEPHONE D'UN CONTACT & L'ADRESSE EMAIL"

echo "\n7- LISTER L'ANNUAIRE"

echo "\n8- FIN DU PROGRAMME"

echo "\n\nQUE VOULEZ-VOUS FAIRE ? \c"

read chiffre
case "$chiffre" in
1) add ;;
2) search
attente
   ;;
3) search1
attente
   ;;
4) search2
attente
   ;;
5) supp ;;
6) modif ;;
7) list
attente
   ;;
8) echo "\n+------------------+"
    echo "| Fin du programme |"
    echo "+------------------+\n"
    exit ;;
*) echo "\nErreur le chiffre choisi n'est pas répertorié !\n \c" ;;
esac
done
