# TP

## Exercice 1 : Scripts de gestion des comptes utilisateurs

* **Énoncé :**

```
Faire un script de gestion des utilisateurs, qui doit permettre :

* de créer des utilisateurs
* de modifier des utilisateurs
* de supprimer des utilisateurs
* de voir tous les utilisateurs
* de faire une recherche sur l'existence d'un utilisateur en particulier
```
-----------------

Mon script n'étant pas 100% fonctionnel, je propose une explication par étape :

### Création d'un utilisateur

J'ai choisi de crée un menu qui permettra au lancement du script d'accéder à différente rubrique, ici nous allons nous rendre sur la rubrique **création d'un utilisateur**.

![Tp1_0](https://github.com/ByMSRT/Shell/blob/main/Images/Tp1_0.png)

Voici un aperçu du script : 

![Tp1_1](https://github.com/ByMSRT/Shell/blob/main/Images/Tp1_1.png)


Dans l'encadré rouge se trouvent :

* Création de l'utilisateur

        sudo dscl . -create /Users/NOM_UTILISATEUR

* Création d'un chemin d'accès pour Shell

        sudo dscl . -create /Users/NOM_UTILISATEUR UserShell /bin/zsh

* Création du nom et prénom

        sudo dscl . -create /Users/NOM_UTILISATEUR prenom "NOM_PRENOM_"

* Attribution d'un ID

        sudo dscl . -create /Users/NOM_UTILISATEUR UniqueID $identifiant

* Attribution d'un groupe ID

        sudo dscl . -create /Users/NOM_UTILISATEUR PrimaryGroupID 600

* Création d'un dossier utilisateur dans le répertoire utilisateur

        sudo dscl . -create /Users/NOM_UTILISATEUR NFSHomeDirectory /Users/NOM_UTILISATEUR

* Création d'un mot de passe

        sudo dscl . -passwd /Users/NOM_UTILISATEUR $MDP


### La modification de l'utilisateur

Malheusement, la modification ne fonctionne pas.

### La suppression de l'utilisateur

![Tp1_2](https://github.com/ByMSRT/Shell/blob/main/Images/Tp1_2.png)

* Suppression de l'utilisateur 

        sudo dscl . -delete /Users/NOM_UTILISATEUR

### La visualisation des utilisateurs

![Tp1_3](https://github.com/ByMSRT/Shell/blob/main/Images/Tp1_3.png)

* Visualisation des utilisateurs

        dscl . -list /Users | grep -v '_' | grep -v 'nobody' | grep -v 'root' | grep -v 'daemon'

### Recherche d'un utilisateur

![Tp1_4](https://github.com/ByMSRT/Shell/blob/main/Images/Tp1_4.png)

* Rechercher un utilisateur

        dscl . -list /Users UniqueID | grep RECHERCHE_UTILISATEUR
        dscl . -list /Users RealName | grep RECHERCHE_UTILISATEUR
        dscl . -list /Users PrimaryGroupID | grep RECHERCHE_UTILISATEUR
        dscl . -list /Users NFSHomeDirectory | grep RECHERCHE_UTILISATEUR
