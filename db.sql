CREATE TABLE Previsions_Recettes_Fiscales (
    id SERIAL PRIMARY KEY,
    nature_impot VARCHAR(100) NOT NULL UNIQUE,
    montant_lfr_2024 NUMERIC(10, 1) NOT NULL,
    montant_lf_2025 NUMERIC(10, 1) NOT NULL
);

INSERT INTO Previsions_Recettes_Fiscales (nature_impot, montant_lfr_2024, montant_lf_2025) VALUES
('Impôt sur les revenus', 1179.0, 1411.4),
('Impôt sur les revenus Salariaux et Assimilés', 848.2, 889.9),
('Impôt sur les revenus des Capitaux Mobiliers', 78.2, 93.7),
('Impôt sur les plus-values Immobilières', 14.0, 18.3),
('Impôt Synthétique', 132.3, 164.7),
('Droit d''Enregistrement', 49.0, 62.8),
('Taxe sur la Valeur Ajoutée (y compris Taxe sur les transactions Mobiles)', 1400.2, 1742.2),
('Impôt sur les marchés Publics', 148.7, 250.0),
('Droit d''Accise (y compris Taxe environnementale)', 754.1, 955.4),
('Taxes sur les Assurances', 17.2, 20.6),
('Droit de Timbres', 14.1, 16.8),
('Autres', 1.5, 2.7);



CREATE TABLE Nature_Impots(
    id_impot SERIAL PRIMARY KEY,
    nom_impot VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Previsions_Annuelles(
    id_prevision SERIAL PRIMARY kEY,
    id_impot INTEGER REFERENCES Nature_Impots(id_impot),
    annee_fiscale DATE,
    montant INT
);