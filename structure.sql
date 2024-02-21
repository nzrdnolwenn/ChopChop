CREATE TABLE Client (

    id_client int(25) primary key not null,
    nom char(65) not null,
    prenom char(65) not null,
    email varchar(85) not null,
    adresse varchar(85) not null,
    login varchar(25) not null,''
    mdp varchar(95) not null,
    porte_feuille int(3) default 0

);

CREATE TABLE Pharmacie (

    id_pharmacie int(25) primary key not null,
    nom varchar(35) not null,
    adresse varchar(85) not null,
    horraire_ouvert varchar(5) not null,
    horraire_fermer varchar(5) not null,
    porte_feuille int(6) default 0

);

CREATE TABLE Pharmacien (

    id_pharmacien int(25) primary key not null,
    id_pharmacie int(25) not null,
    nom char(65) not null,
    prenom char(65) not null,
    email varchar(85) not null,
    adresse varchar(85) not null,
    login varchar(25) not null,
    mdp varchar(95) not null,
    porte_feuille int(3) default 0,
    foreign key( id_pharmacie ) references Pharmacie(id_pharmacie)

);

CREATE TABLE Livreur (

    id_livreur int(25) primary key not null,
    nom char(65) not null,
    prenom char(65) not null,
    email varchar(85) not null,
    adresse varchar(85) not null,
    login varchar(25) not null,
    mdp varchar(95) not null,
    transport varchar(35) not null,
    porte_feuille int(3) default 0

);

CREATE TABLE Medicament (

    nom varchar(85) primary key not null,
    type varchar(85) not null,
    effet char(95) not null,
    temp_effet_min int(3) not null default 30,
    duree_effet_min int(3) not null default 60,
    niveau_danger int(2) not null,
    qt_max int(2) not null,
    deconseiller_à varchar(25) not null,
    prix int(3) not null

);

CREATE TABLE Commande (

    id_commande int(25) primary key not null,
    client int(25) not null,
    pharmacie int(25) not null,
    medicament varchar(85) not null,
    livreur int(25) not null,
    quantitee int(2) not null,
    ordonance varchar(95) not null,
    foreign key( pharmacie ) references Pharmacie(id_pharmacie),
    foreign key( client ) references Client(id_client),
    foreign key( medicament ) references Medicament(nom),
    foreign key( livreur ) references Livreur(id_livreur)

);

CREATE TABLE Stock (

    pharmacie int(25) primary key not null,
    medicament int(25) primary key not null,
    quantitee int(2) not null,
    foreign key( pharmacie ) references Pharmacie(id_pharmacie),
    foreign key( medicament ) references Medicament(nom)

);

CREATE TABLE Transaction (

    commande int(25) not null,
    client int(25) not null,
    pharmacie int(25) not null,
    livreur int(25) not null,
    foreign key( pharmacie ) references Pharmacie(id_pharmacie),
    foreign key( client ) references Client(id_client),
    foreign key( commande ) references Commande(id_commande),
    foreign key( livreur ) references Livreur(id_livreur)

);