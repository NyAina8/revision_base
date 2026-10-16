# Niveau 1

## Etape 1 (liste plat avec prix)

**Plat** (**id_plat**, nom, prix) (nouveau)
- Je choisis INTEGER pour le prix, car les montants sont des nombres entiers en ariary. Je choisis un identifiant numérique id_plat comme clé primaire plutôt que le nom du plat, car le nom peut changer.

## Etape 2 (Categories)

**categorie** (**id_categorie**, nom) (nouveau)

**Plat** (**id_plat**, nom, prix, #id_categorie) (modifié)