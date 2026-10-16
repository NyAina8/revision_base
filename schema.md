# Niveau 1

## Etape 1 (liste plat avec prix)

**Plat** (**id_plat**, nom, prix) (nouveau)
- Je choisis INTEGER pour le prix, car les montants sont des nombres entiers en ariary. Je choisis un identifiant numérique id_plat comme clé primaire plutôt que le nom du plat, car le nom peut changer.

## Etape 2 (Categories)

**categorie** (**id_categorie**, nom) (nouveau)

**Plat** (**id_plat**, nom, prix, **#id_categorie**) (modifié)
- Parce qu'on risque d'avoir des incohérences dans les noms des catégories, par exemple Plat malagasy, Plats malagasy et Plat Malagasy. Une table séparée permet de centraliser les catégories et d'éviter des erreurs.

## Etape 3 (commandes)

**categorie** (**id_categorie**, nom)

**Plat** (**id_plat**, nom, prix, #id_categorie)

**commande** (**id_commande**, date_commande) (nouveau)

**ligne_commande** (**#id_commande**, **#id_plat**, quantite) (nouveau)
- La quantité doit être placée dans ligne_commande, et non dans plat ou commande, puisque ça dépend à la fois du plat et de la commande.

## Etape 4 (habitués)

**categorie** (**id_categorie**, nom)

**Plat** (**id_plat**, nom, prix, #id_categorie)

**commande** (**id_commande**, date_commande, #id_client?) (modifié)

**ligne_commande** (**#id_commande**, **#id_plat**, quantite)

**client** (**id_client**, nom) (nouveau)
-   Non, id_client doit accepter NULL, car certains clients sont de passage. Il faut utiliser LEFT JOIN pour afficher toutes les commandes, même celles qui n'ont aucun client associé.