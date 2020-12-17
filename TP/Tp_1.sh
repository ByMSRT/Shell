var1="utilisateurs"
var2="utilisateur"
description="\nVoici l'objectif du script :\n- La création des $var1\n- La modification des $var1\n- La suppression des $var1\n- La visualisation des $var1 sur la machine\n- Recherche d'un utilisateur en particulier\n\n"
echo $description

menu="\nMenu du script (Gestion des $var1) :\n\n1. Crée un $var2\\n2. Modifier un $var2\n3. Supprimer un $var2\n4. Visualisation des $var1\n5. Recherche un utilisateur"

attention="Attention ce script aura la possibilité d'agir sur votre machine ! Êtes-vous de continuer ?"
echo $attention
read confirm

if [ $confirm == "Oui" ] || [ $confirm == "oui" ]; then
    echo $menu
elif [ $confirm == "Non" ] || [ $confirm == "non" ]; then
    echo "Fin du script"
    exit
fi

read choix

while [ -z $choix ] || ((number>5)); do
    echo "$menu\nEntrer un numéro : \c"
    read $choix
done

while [ $choix != "quitter" ]; do
    if ((number==1)); then
        echo "Entrer le nom du nouvel $var2 : \c"
        read pseudo

        echo "Entrer le nom et prénom du nouvel $var2 : \c"
        read prenom

        echo "Entrer son identifiant (Doit être supérieur à 502) : \c"
        read identifiant

        while ((identifiant <502)); do
            echo "Erreur, l'identifiant doit être supérieur à 502 ! --> : \c"
            read identifiant
        done

        echo "Entrer le mot de passe de l'utilisateur : \c"
        read MDP

        sudo dscl . -create /Users/$pseudo
        sudo dscl . -create /Users/$pseudo UserShell /bin/zsh
        sudo dscl . -create /Users/$pseudo prenom "$prenom"
        sudo dscl . -create /Users/$pseudo UniqueID $identifiant
        sudo dscl . -create /Users/$pseudo PrimaryGroupID 600
        sudo dscl . -create /Users/$pseudo NFSHomeDirectory /Users/$pseudo
        sudo dscl . -passwd /Users/$pseudo $MDP

        echo "L'utilisateur $pseudo à été crée avec succès !"

    elif ((number==2)); then
        echo "Quel $var2 souhaitez-vous modifier ?"
        read modifuser

        echo "Que souhaitez-vous modifier ?\n1. Pseudo\n2. Nom & Prénom\n3. Identifiant\n4. Mot de passe : \c"
        read modif
        while [ -z $modif] || ((modif>4)); do
            echo "Que souhaitez-vous modifier ?\n1. Pseudo\n2. Nom & Prénom\n3. Identifiant\n4. Mot de passe : \c"
            read modif
            echo "Donnez le nom d'utilisateur ? : \c"
            read pseudo
        done
        if ((modif==2)); then
        echo "Quel nom complet voulez-vous donner ? \c"
        read prenom
        sudo dscl . -create /Users/$pseudo prenom "$prenom"
        fi
    
    elif ((number==3)); then
        echo "Quel utilisateur voulez-vous supprimer ?"
        read modifuser
        sudo dscl . -delete /Users/$modifuser

    elif ((number==4)); then
        echo "Voici tous les utilisateurs : "
        dscl . -list /Users | grep -v '_' | grep -v 'nobody' | grep -v 'root' | grep -v 'daemon'
    
    elif ((number==5)); then
        echo "Entrez le nom de l'utilisateur que vous voulez rechercher : \c"
        read search
        echo "Nom d'utilisateur :" | dscl . -list /Users | grep $search
        dscl . -list /Users UniqueID | grep $search
        dscl . -list /Users RealName | grep $search
        dscl . -list /Users PrimaryGroupID | grep $search
        dscl . -list /Users NFSHomeDirectory | grep $search
    fi

    echo "Voulez-vous retourner au menu ? \c"
    read reponse
    if [ $reponse == "Oui" ] || [ $reponse == "oui" ]; then
        echo $menu
        read number
    elif [ $reponse == "Non" ] || [ $reponse == "non" ]; then
        exit
    fi
done



