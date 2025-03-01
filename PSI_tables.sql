CREATE DATABASE IF NOT EXISTS base_livin_paris ;
USE base_livin_paris;

CREATE TABLE IF NOT EXISTS Utilisateur (
   ID_utilisateur INT PRIMARY KEY,
   Mot_de_passe_utilisateur VARCHAR(50),
   Nom_utilisateur VARCHAR(50),
   Prénom_utilisateur VARCHAR(50),
   Adresse_utilisateur VARCHAR(50),
   Num_tel_utilisateur VARCHAR(10),
   Utilisateur_est_entreprise BOOLEAN,
   Nom_entreprise VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Client (
   ID_Client INT PRIMARY KEY,
   ID_utilisateur INT NOT NULL UNIQUE,
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateur(ID_utilisateur) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Cuisinier (
   ID_Cuisinier INT PRIMARY KEY,
   Nbre_plat_proposé_Cuisinier INT,
   Plat_du_jour_Cuisinier VARCHAR(50),
   Nbre_Commande INT DEFAULT 0,
   ID_utilisateur INT NOT NULL UNIQUE,
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateur(ID_utilisateur) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Plat (
   ID_Plat INT PRIMARY KEY,
   Type_Plat VARCHAR(50),
   Pr_cmb_de_personnes_Plat INT,
   Prix_par_perso_Plat DECIMAL(10,2),
   Nationalité_cuisine_Plat VARCHAR(50),
   Régime_alimentaire_Plat VARCHAR(255),
   Ingrédients_principaux_Plat TEXT,
   ID_Cuisinier INT NOT NULL,
   FOREIGN KEY(ID_Cuisinier) REFERENCES Cuisinier(ID_Cuisinier) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Livreur (
   ID_Livreur INT PRIMARY KEY,
   Gain_Livreur DECIMAL(15,2),
   ID_utilisateur INT NOT NULL UNIQUE,
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateur(ID_utilisateur) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Commentaire (
   ID_Commentaire INT PRIMARY KEY,
   Note_Commentaire INT,
   Texte_Commentaire TEXT,
   ID_Client INT NOT NULL,
   ID_Plat INT NOT NULL,
   FOREIGN KEY(ID_Client) REFERENCES Client(ID_Client) ON DELETE CASCADE,
   FOREIGN KEY(ID_Plat) REFERENCES Plat(ID_Plat) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Commande (
   ID_Commande INT PRIMARY KEY,
   Prix_Commande DECIMAL(10,2),
   Date_Commande DATETIME,
   Taille_Commande INT,
   ID_Client INT NOT NULL,
   FOREIGN KEY(ID_Client) REFERENCES Client(ID_Client) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Livraison (
   ID_Livraison INT PRIMARY KEY,
   Adresse_initiale_Livraison VARCHAR(50),
   Adresse_finale_Livraison VARCHAR(50),
   Prix_Livraison DECIMAL(10,2),
   Date_Livraison DATETIME,
   ID_Commande INT NOT NULL,
   ID_Livreur INT NOT NULL,
   FOREIGN KEY(ID_Commande) REFERENCES Commande(ID_Commande) ON DELETE CASCADE,
   FOREIGN KEY(ID_Livreur) REFERENCES Livreur(ID_Livreur) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Contient (
   ID_Plat INT,
   ID_Commande INT,
   PRIMARY KEY(ID_Plat, ID_Commande),
   FOREIGN KEY(ID_Plat) REFERENCES Plat(ID_Plat) ON DELETE CASCADE,
   FOREIGN KEY(ID_Commande) REFERENCES Commande(ID_Commande) ON DELETE CASCADE
);