
SELECT *
FROM
(SELECT L.noClient, Article.noArticle, SUM(L.quantite * Article.prixUnitaire) as Product
FROM Article
JOIN
(SELECT Commande.noClient, LigneCommande.noCommande, LigneCommande.noArticle, LigneCommande.quantite
FROM Commande
JOIN LigneCommande on Commande.noCommande = LigneCommande.noCommande) L
ON Article.noArticle = L.noArticle
GROUP BY L.noClient, Article.noArticle)
WHERE Product > 150
/



