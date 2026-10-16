-- Active: 1760882206375@@localhost@5432@radoresto@public
-- liste des plats avec prix
SELECT * FROM Plat;

-- Étape 2 : Nombre de plats par catégorie
SELECT c.nom, COUNT(p.id_plat) AS nombre_plats
FROM categorie c
LEFT JOIN plat p ON c.id_categorie = p.id_categorie
GROUP BY c.id_categorie, c.nom
ORDER BY c.nom;

