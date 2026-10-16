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
