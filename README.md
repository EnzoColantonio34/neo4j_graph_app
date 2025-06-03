# Neo4j Graph App – Système de recommandations

## Description
Ce projet est une API simple permettant d'interroger une base Neo4j contenant des clients, des commandes et des produits. Il permet notamment :

- D'obtenir les produits achetés par un client
- De suggérer des produits en fonction des achats similaires

## Prérequis
- Python 3.8+
- Neo4j en local (port 7687)
- Un mot de passe administrateur défini (ex : motdepasse123)

## Installation

```bash
git clone https://github.com/EnzoColantonio34/neo4j_graph_app
cd neo4j_graph_app
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## Lancement de l’API

```bash
uvicorn main:app --reload
```

Accès à l'API : [http://localhost:8000/docs](http://localhost:8000/docs)

## Fichier d'insertion
Exécutez le fichier `insertion.cypher` dans l'interface Neo4j (http://localhost:7474).

# Guide de lancement de l'application Python

## Prérequis
- Python 3.8 ou plus
- Neo4j Desktop ou Docker (base de données accessible sur `bolt://localhost:7687`)

## Installation
1. Clonez le dépôt ou placez-vous dans le dossier du projet.
2. Installez les dépendances :
   ```bash
   pip install -r requirements.txt
   ```
3. Démarrez Neo4j et importez les données avec le fichier `insertion.cypher` via Neo4j Browser ou en ligne de commande.

## Lancement de l'application
1. Configurez les identifiants Neo4j dans `main.py` si besoin (utilisateur/mot de passe).
2. Lancez l'application :
   ```bash
   python main.py
   ```
3. L'API REST sera accessible sur `http://localhost:5000` (par défaut).

## Utilisation
- Utilisez un outil comme Postman ou curl pour interroger les endpoints définis dans l'API.
- Exemples d'endpoints :
  - `/produits_par_client/<nom_client>`
  - `/suggestion/<nom_client>`

Voir le fichier `requetes.md` pour les requêtes Cypher détaillées.
