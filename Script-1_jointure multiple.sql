SELECT produits.nom_produit, villes.nom_ville, ventes.date_vente, ventes.quantite_vendue
FROM ventes
INNER JOIN produits
ON ventes.id_produit  = produits.id_produit
INNER JOIN magasins
ON produits.id_produit =ventes.id_magasin
INNER JOIN villes
ON magasins.id_ville =villes.id_ville ;
SELECT produits.nom_produit, produits.prix, ventes.quantite_vendue, villes.nom_ville
FROM ventes
JOIN produits
ON ventes.id_produit = produits.id_produit 
JOIN magasins
ON ventes.id_magasin = magasins.id_magasin 
JOIN villes
ON magasins.id_ville= villes.id_ville 
WHERE villes.nom_ville IN ('Goma','Bukavu');
SELECT produits.nom_produit, SUM(ventes.quantite_vendue) AS total_quantite_vendue
FROM ventes
INNER JOIN produits
ON ventes.id_produit =produits.id_produit 
INNER JOIN magasins
ON ventes.id_magasin =magasins.id_magasin 
INNER JOIN villes
ON magasins.id_ville =villes.id_ville
INNER JOIN categories
ON  produits.id_categorie =categories.id_categorie 
WHERE villes.nom_ville ='Lubumbashi'AND  categories.nom_categorie='Running'
GROUP BY produits.nom_produit;
SELECT magasins.nom_magasin,villes.nom_ville, SUM(produits.prix* ventes.quantite_vendue ) AS Chiffre_Affraire_total
FROM ventes
INNER JOIN  magasins
ON ventes.id_magasin  =magasins.id_magasin  
INNER JOIN villes
ON magasins.id_ville =villes.id_ville 
INNER JOIN produits
ON ventes.id_produit =produits.id_produit 
GROUP BY magasins.nom_magasin ,villes.nom_ville 
ORDER BY Chiffre_Affraire_total DESC; 
SELECT DISTINCT 
villes.nom_ville, categories.nom_categorie
FROM ventes
INNER JOIN magasins
ON ventes.id_magasin = magasins.id_magasin 
INNER JOIN villes
ON magasins.id_ville =villes.id_ville 
INNER JOIN produits
ON ventes.id_produit =produits.id_produit 
INNER JOIN categories
ON produits.id_categorie =categories.id_categorie;



