SELECT * FROM Client;
SELECT * FROM Cuisinier;
SELECT * FROM Utilisateur;
SELECT count(*) FROM Utilisateur;
SELECT AVG(Nbre_Commande) AS NBRE_COMMANDE_MOYEN FROM Cuisinier;

SELECT Nom_utilisateur, Prénom_utilisateur
FROM Utilisateur
WHERE Adresse_utilisateur = '15 Rue Cardinet, Paris';

SELECT utilisateur.Nom_utilisateur, utilisateur.Prénom_utilisateur
FROM Cuisinier 
JOIN utilisateur ON utilisateur.ID_utilisateur = Cuisinier.ID_utilisateur
WHERE Cuisinier.Plat_du_jour_Cuisinier = 'Pizza végétarienne';

SELECT * FROM Utilisateur WHERE Utilisateur_est_entreprise = TRUE;
SELECT * FROM Cuisinier WHERE Plat_du_jour_Cuisinier = 'Pizza végétarienne';