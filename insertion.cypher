// Clients
CREATE (:Client {id: 1, nom: "Alice"});
CREATE (:Client {id: 2, nom: "Bob"});
CREATE (:Client {id: 3, nom: "Claire"});

// Produits
CREATE (:Produit {id: "P1", nom: "Café"});
CREATE (:Produit {id: "P2", nom: "Thé"});
CREATE (:Produit {id: "P3", nom: "Chocolat"});
CREATE (:Produit {id: "P4", nom: "Biscuit"});
CREATE (:Produit {id: "P5", nom: "Jus"});

// Commandes
CREATE (:Commande {id: 100, date: "2024-05-01"});
CREATE (:Commande {id: 101, date: "2024-05-03"});
CREATE (:Commande {id: 102, date: "2024-05-05"});

// Relations A_EFFECTUÉ
MATCH (a:Client {nom: "Alice"}), (c:Commande {id: 100})
CREATE (a)-[:A_EFFECTUÉ]->(c);

MATCH (b:Client {nom: "Bob"}), (c:Commande {id: 101})
CREATE (b)-[:A_EFFECTUÉ]->(c);

MATCH (cl:Client {nom: "Claire"}), (c:Commande {id: 102})
CREATE (cl)-[:A_EFFECTUÉ]->(c);

// Relations CONTIENT
MATCH (c:Commande {id: 100}), (p1:Produit {nom: "Café"}), (p2:Produit {nom: "Thé"})
CREATE (c)-[:CONTIENT]->(p1),
       (c)-[:CONTIENT]->(p2);

MATCH (c:Commande {id: 101}), (p3:Produit {nom: "Chocolat"}), (p4:Produit {nom: "Biscuit"})
CREATE (c)-[:CONTIENT]->(p3),
       (c)-[:CONTIENT]->(p4);

MATCH (c:Commande {id: 102}), (p2:Produit {nom: "Thé"}), (p5:Produit {nom: "Jus"})
CREATE (c)-[:CONTIENT]->(p2),
       (c)-[:CONTIENT]->(p5);
