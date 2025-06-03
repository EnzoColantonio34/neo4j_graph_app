# Requêtes Cypher pour l'application Neo4j

## 1. Trouver tous les produits achetés par un client
```cypher
MATCH (c:Client {nom: "Alice"})-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(p:Produit)
RETURN p.nom
```
*Retourne la liste des produits achetés par le client "Alice".*

---

## 2. Identifier les clients ayant acheté un produit donné
```cypher
MATCH (cl:Client)-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(p:Produit {nom: "Thé"})
RETURN cl.nom
```
*Retourne les clients ayant acheté le produit "Thé".*

---

## 3. Dresser la liste des commandes contenant un produit spécifique
```cypher
MATCH (co:Commande)-[:CONTIENT]->(p:Produit {nom: "Chocolat"})
RETURN co.id, co.date
```
*Retourne les commandes contenant le produit "Chocolat".*

---

## 4. Suggestions de produits basées sur des comportements similaires
```cypher
MATCH (c1:Client {nom: "Alice"})-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(p:Produit)<-[:CONTIENT]-(:Commande)<-[:A_EFFECTUÉ]-(c2:Client),
      (c2)-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(suggestion:Produit)
WHERE c1 <> c2 AND NOT (c1)-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(suggestion)
RETURN DISTINCT suggestion.nom
```
*Retourne des suggestions de produits pour Alice, basées sur les achats de clients similaires.*
