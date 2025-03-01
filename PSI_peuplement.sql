USE base_livin_paris;

-- Afin de mieux se retrouver parmi tous les identifiants qui sont des entiers (même si les identifiants sont chacun ceux d'une table, 
-- donc ils sont propres à chaque table), on a fait un système pour mieux s'y retrouver quand on lit les données, quand l'identifiant 
-- commence par un certain chiffre, cela signifie que cet idientifiant represente une certaine table (comme on a peu de données, ce
-- système suffit pour mieux se retrouver), il n'a évidamment aucune incidence sur le fonctionnement de la base. Ainsi:
-- 1 (Utilisateur), 2 (Client), 3 (Cuisinier), 4 (Livreur), 5 (Plat), 6 (Commande), 7 (Livraison), 8 (Commentaire)

-- On va remplir la base de données avec des utilisateurs
INSERT INTO Utilisateur (ID_utilisateur, Mot_de_passe_utilisateur, Nom_utilisateur, Prénom_utilisateur, Adresse_utilisateur, Num_tel_utilisateur, Utilisateur_est_entreprise, Nom_entreprise)
VALUES ('101', 'pass123', 'Durand', 'Medhy', '15 Rue Cardinet, Paris', '0690123456', FALSE, NULL);
INSERT INTO Utilisateur (ID_utilisateur, Mot_de_passe_utilisateur, Nom_utilisateur, Prénom_utilisateur, Adresse_utilisateur, Num_tel_utilisateur, Utilisateur_est_entreprise, Nom_entreprise)
VALUES ('102', 'pass456', 'Martin', 'Sophie', '20 Avenue Foch, Paris', '0601234567', FALSE, NULL);
INSERT INTO Utilisateur (ID_utilisateur, Mot_de_passe_utilisateur, Nom_utilisateur, Prénom_utilisateur, Adresse_utilisateur, Num_tel_utilisateur, Utilisateur_est_entreprise, Nom_entreprise)
VALUES ('103', 'pass789', 'Bernard', 'Luc', '30 Avenue des Champs-Elysées, Paris', '0612345678', FALSE, NULL);
INSERT INTO Utilisateur (ID_utilisateur, Mot_de_passe_utilisateur, Nom_utilisateur, Prénom_utilisateur, Adresse_utilisateur, Num_tel_utilisateur, Utilisateur_est_entreprise, Nom_entreprise)
VALUES ('104', 'pass147', 'Robert', 'Emma', '40 Rue test, Paris', '0623456789', FALSE, NULL),
('105', 'pass258', 'Durand', 'Paul', '50 Rue test, Paris', '0634567890', FALSE, NULL),   	-- Pour que ce soit plus lisible, nous allons désormais mettre direcement toutes les values après avoir déclaré
('106', 'pass369', 'Lemoine', 'Alice', '60 Rue test2, Paris', '0645678901', FALSE, NULL),	-- les instructions INSERT
('107', 'pass951', 'Morel', 'Louis', '70 Rue test2, Paris', '0656789012', FALSE, NULL),
('108', 'pass753', 'Blanc', 'Julie', '80 Rue test3, Paris', '0656789012', FALSE, NULL),
('109', 'pass852', 'Garcia', 'Antoine', '90 Rue test3, Paris', '0678901234', FALSE, NULL),
('110', 'pass963', 'Fischer', 'Nina', '100 Rue test4, Paris', '0689012345', FALSE, NULL),
('111', 'pass234', 'Mohammed', 'Ali', '110 Rue test4, Paris', '1234567890', TRUE, 'Boxe entreprise'),
('112', 'pass654', 'Jobs', 'Steve', '112 Rue test5, Paris', '0678561289', TRUE, 'Apple Corporation'),
('113', 'pass4', 'Leclerc', 'Charles', '152 Rue test5', '0645788956', TRUE, 'Restaurant Leclerc'),
('114', 'pass789', 'Maestria', 'Giovanni', '852 Rue test6', '0678946512', TRUE, 'Les pizzas de la mama');

-- Maintenant on va définir les clients
INSERT INTO Client (ID_Client, ID_utilisateur)
VALUES ('201', '101'),
('202', '102'),
('203', '103'),
('204', '104'),
('205', '105'),
('206', '111'),
('207', '112');

-- On va ensuite définir les cuisiniers
INSERT INTO Cuisinier (ID_Cuisinier, Nbre_plat_proposé_Cuisinier, Plat_du_jour_Cuisinier, Nbre_Commande, ID_utilisateur)
VALUES ('301', 10, 'Pizza végétarienne', 0, '106'),
('302', 15, 'Sushi', 2, '107'),
('303', 8, 'Tacos', 4, '108'),
('304', 10, 'Tacos', 15, '113'),
('305', 8, 'Pizza marguarita', 18, '114');

-- On fait les livreurs
INSERT INTO Livreur (ID_Livreur, Gain_Livreur, ID_utilisateur)
VALUES ('401', 500.50, '109'),
('402', 350.75, '110');

-- Maintenant on va créer des plats, des commandes, des livraisons et des commentaires
-- Insertion de 15 plats avec des cuisiniers existants
-- Maintenant on va créer des plats, des commandes, des livraisons et des commentaires
-- Insertion de 15 plats avec des cuisiniers existants
INSERT INTO Plat (ID_Plat, Type_Plat, Pr_cmb_de_personnes_Plat, Prix_par_perso_Plat, Nationalité_cuisine_Plat, Régime_alimentaire_Plat, Ingrédients_principaux_Plat, ID_Cuisinier) VALUES 
('501', 'Pizza végétarienne', '2', '12.50', 'Italienne', 'Végétarien', 'Farine, Tomate, Fromage', '301'),
('502', 'Sushi', '1', '15.00', 'Japonaise', 'Poisson cru', 'Riz, Saumon, Algues', '302'),
('503', 'Tacos', '1', '8.50', 'Mexicaine', 'Viande', 'Tortilla, Bœuf, Fromage', '304'),
('504', 'Pâtes Carbonara', '2', '10.00', 'Italienne', 'Omnivore', 'Pâtes, Crème, Lardons', '305'),
('505', 'Salade César', '1', '9.00', 'Américaine', 'Végétarien', 'Salade, Poulet, Parmesan', '304'),
('506', 'Ratatouille', '2', '11.00', 'Française', 'Végétarien', 'Aubergine, Courgette, Tomate', '301'),
('507', 'Couscous', '4', '20.00', 'Marocaine', 'Halal', 'Semoule, Viande, Légumes', '304'),
('508', 'Burger', '1', '14.50', 'Américaine', 'Omnivore', 'Pain, Steak, Fromage', '304'),
('509', 'Paella', '3', '18.00', 'Espagnole', 'Poisson', 'Riz, Fruits de mer, Safran', '303'),
('510', 'Soupe Pho', '2', '13.00', 'Vietnamienne', 'Sans gluten', 'Nouilles de riz, Bouillon, Bœuf', '304'),
('511', 'Samosa', '1', '5.00', 'Indienne', 'Végétarien', 'Pâte, Légumes, Épices', '304'),
('512', 'Poutine', '2', '10.00', 'Canadienne', 'Omnivore', 'Frites, Fromage, Sauce brune', '303'),
('513', 'Bruschetta', '1', '6.50', 'Italienne', 'Végétarien', 'Pain, Tomate, Basilic', '305'),
('514', 'Gyoza', '1', '8.00', 'Japonaise', 'Viande', 'Pâte, Porc, Gingembre', '302'),
('515', 'Pizza marguaritha', '2', '12.50', 'Italienne', 'Viande', 'Farine, Tomate, Fromage, Jambon', '305');

-- Insertion de 20 commandes avec des clients existants
INSERT INTO Commande (ID_Commande, Prix_Commande, Date_Commande, Taille_Commande, ID_Client)
VALUES 
('601', '25.00', NOW(), '2', '201'),
('602', '15.00', NOW(), '1', '201'),
('603', '30.00', ('2025-03-01'), '3', '202'),
('604', '18.00', ('2024-03-12'), '2', '202'),
('605', '22.00', ('2025-02-14'), '2', '203'),
('606', '12.50', ('2025-01-25'), '1', '203'),
('607', '14.00', ('2024-06-17'), '1', '204'),
('608', '20.00', ('2024-12-24'), '2', '204');

-- Insertion des liens entre commandes et plats
INSERT INTO Contient (ID_Plat, ID_Commande)
VALUES 
('501', '601'),
('502', '602'),
('503', '603'),
('509', '605'),
('508', '607');


-- Insertion de 20 livraisons avec des livreurs existants
INSERT INTO Livraison (ID_Livraison, Adresse_initiale_Livraison, Adresse_finale_Livraison, Prix_Livraison, Date_Livraison, ID_Commande, ID_Livreur)
VALUES 
('701', '10 Rue A', '20 Rue B', '5.00', NOW(), '601', '401'),
('702', '30 Rue C', '40 Rue D', '4.50', NOW(), '602', '402'),
('703', '50 Rue E', '60 Rue F', '6.00', ('2025-03-01'), '603', '401'),
('704', '70 Rue G', '80 Rue H', '3.50', ('2024-03-12'), '604', '401'),
('705', '90 Rue I', '100 Rue J', '7.00', ('2025-02-14'), '605', '401'),
('706', '110 Rue K', '120 Rue L', '5.50', ('2025-01-25'), '606', '401'),
('707', '130 Rue M', '140 Rue N', '4.00', ('2024-06-17'), '607', '401'),
('708', '150 Rue O', '160 Rue P', '6.50', ('2024-12-24'), '608', '401');

-- Insertion des commentaires
INSERT INTO Commentaire (ID_Commentaire, Note_Commentaire, Texte_Commentaire, ID_Client, ID_Plat)
VALUES 
('801', 5, 'Excellent plat, la pizza était délicieuse et bien garnie.', '201', '501'),
('802', 4, 'Les sushis étaient bons, mais un peu trop de riz à mon goût.', '201', '502'),
('803', 3, 'Le tacos était correct, mais un peu sec.', '202', '503'),
('804', 5, 'La paella était incroyable, pleine de saveurs et bien cuite.', '203', '509'),
('805', 2, 'Un peu déçu par le burger, la viande était trop cuite.', '204', '508');