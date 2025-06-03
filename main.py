from flask import Flask, jsonify
from neo4j import GraphDatabase
import os

# Configuration Neo4j
NEO4J_URI = os.getenv("NEO4J_URI", "bolt://localhost:7687")
NEO4J_USER = os.getenv("NEO4J_USER", "neo4j")
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD", "neo4j")

driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))
app = Flask(__name__)

@app.route("/produits_par_client/<nom_client>")
def produits_par_client(nom_client):
    query = (
        "MATCH (c:Client {nom: $nom})-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(p:Produit) "
        "RETURN DISTINCT p.nom AS produit"
    )
    with driver.session() as session:
        result = session.run(query, nom=nom_client)
        produits = [record["produit"] for record in result]
    return jsonify({"client": nom_client, "produits": produits})

@app.route("/suggestion/<nom_client>")
def suggestion(nom_client):
    query = (
        "MATCH (c1:Client {nom: $nom})-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(p:Produit)<-[:CONTIENT]-(:Commande)<-[:A_EFFECTUÉ]-(c2:Client), "
        "      (c2)-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(suggestion:Produit) "
        "WHERE c1 <> c2 AND NOT (c1)-[:A_EFFECTUÉ]->(:Commande)-[:CONTIENT]->(suggestion) "
        "RETURN DISTINCT suggestion.nom AS suggestion LIMIT 5"
    )
    with driver.session() as session:
        result = session.run(query, nom=nom_client)
        suggestions = [record["suggestion"] for record in result]
    return jsonify({"client": nom_client, "suggestions": suggestions})

if __name__ == "__main__":
    app.run(debug=True)
