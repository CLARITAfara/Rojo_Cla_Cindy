

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

-- Modifier la table si nécessaire
ALTER TABLE Previsions_Annuelles 
ALTER COLUMN montant TYPE DECIMAL(10,2);

-- 1. Insérer les noms des impôts dans Nature_Impots
INSERT INTO Nature_Impots (nom_impot) VALUES
('Impôt sur les revenus'),
('Impôt sur les revenus Salariaux et Assimilés'),
('Impôt sur les revenus des Capitaux Mobiliers'),
('Impôt sur les plus-values Immobilières'),
('Impôt Synthétique'),
('Droit d''Enregistrement'),
('Taxe sur la Valeur Ajoutée (y compris Taxe sur les transactions Mobiles)'),
('Impôt sur les marchés Publics'),
('Droit d''Accise (y compris Taxe environnementale)'),
('Taxes sur les Assurances'),
('Droit de Timbres'),
('Autres');

-- 2. Insérer les prévisions pour 2024 (LFR)
INSERT INTO Previsions_Annuelles (id_impot, annee_fiscale, montant) VALUES
(1, '2024-01-01', 1179.0),
(2, '2024-01-01', 848.2),
(3, '2024-01-01', 78.2),
(4, '2024-01-01', 14.0),
(5, '2024-01-01', 132.3),
(6, '2024-01-01', 49.0),
(7, '2024-01-01', 1400.2),
(8, '2024-01-01', 148.7),
(9, '2024-01-01', 754.1),
(10, '2024-01-01', 17.2),
(11, '2024-01-01', 14.1),
(12, '2024-01-01', 1.5);

-- 3. Insérer les prévisions pour 2025 (LF)
INSERT INTO Previsions_Annuelles (id_impot, annee_fiscale, montant) VALUES
(1, '2025-01-01', 1411.4),
(2, '2025-01-01', 889.9),
(3, '2025-01-01', 93.7),
(4, '2025-01-01', 18.3),
(5, '2025-01-01', 164.7),
(6, '2025-01-01', 62.8),
(7, '2025-01-01', 1742.2),
(8, '2025-01-01', 250.0),
(9, '2025-01-01', 955.4),
(10, '2025-01-01', 20.6),
(11, '2025-01-01', 16.8),
(12, '2025-01-01', 2.7);