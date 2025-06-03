# Rapport synthétique

## Objectif
Modéliser les interactions entre clients, commandes et produits pour une entreprise, exploiter ces données via Neo4j et exposer des fonctionnalités de suggestion et de recherche via une API simple.

## Démarche
- **Modélisation** : Trois types de nœuds (Client, Commande, Produit) et deux types de relations (A_EFFECTUÉ, CONTIENT).
- **Insertion** : Jeu de données modeste, illustrant plusieurs clients, commandes et produits.
- **Requêtage** : Rédaction de requêtes Cypher pour explorer les achats, les clients, les commandes et générer des suggestions personnalisées.
- **Application** : Développement d'une API REST en Python permettant d'interroger dynamiquement la base Neo4j.

## Points clés
- Schéma simple, facilement extensible.
- Requêtes optimisées pour la suggestion de produits.
- Application légère, facile à déployer.

## Limites et perspectives
- Volume de données limité pour la démonstration.
- Possibilité d'ajouter des fonctionnalités (historique, préférences, etc.)

## Schéma du graphe

```
(Client)-[:A_EFFECTUÉ]->(Commande)-[:CONTIENT]->(Produit)
```

## Fichiers livrés
- insertion.cypher : insertion des données
- requetes.md : requêtes Cypher commentées
- main.py : code source de l'API
- README.md : guide de lancement
