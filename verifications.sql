-- Active: 1760882206375@@localhost@5432@radoresto@public
-- liste des plats avec prix
SELECT * FROM Plat;

-- Étape 2 : Nombre de plats par catégorie
SELECT c.nom, COUNT(p.id_plat) AS nombre_plats
FROM categorie c
LEFT JOIN plat p ON c.id_categorie = p.id_categorie
GROUP BY c.id_categorie, c.nom
ORDER BY c.nom;

-- Étape 3 : Montant total de chaque commande
SELECT
    c.id_commande,
    c.date_commande,
    COALESCE(SUM(p.prix * lc.quantite), 0) AS montant_total
FROM commande c
LEFT JOIN ligne_commande lc
    ON c.id_commande = lc.id_commande
LEFT JOIN plat p
    ON lc.id_plat = p.id_plat
GROUP BY c.id_commande, c.date_commande
ORDER BY c.id_commande;


-- Étape 4 : Commandes et clients
SELECT
    c.id_commande,
    c.date_commande,
    COALESCE(cl.nom, 'client de passage') AS client
FROM commande c
LEFT JOIN client cl
    ON c.id_client = cl.id_client
ORDER BY c.id_commande;

-- Étape 5 : Nombre de commandes et CA par serveur

SELECT
    s.nom AS serveur,
    COUNT(DISTINCT c.id_commande) AS nombre_commandes,
    COALESCE(SUM(p.prix * lc.quantite), 0) AS chiffre_affaires
FROM serveur s
LEFT JOIN commande c
    ON s.id_serveur = c.id_serveur
LEFT JOIN ligne_commande lc
    ON c.id_commande = lc.id_commande
LEFT JOIN plat p
    ON lc.id_plat = p.id_plat
GROUP BY s.id_serveur, s.nom
ORDER BY s.nom;

SELECT
    c.id_commande,
    s.nom AS serveur,
    COALESCE(t.numero::TEXT, 'À emporter') AS table_numero
FROM commande c
JOIN serveur s
    ON c.id_serveur = s.id_serveur
LEFT JOIN table_salle t
    ON c.id_table = t.id_table
ORDER BY c.id_commande;