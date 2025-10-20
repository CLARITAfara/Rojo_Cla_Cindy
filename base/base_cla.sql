-- ============================================
-- SCHÉMA POSTGRESQL POUR BUDGET DES CITOYENS
-- Pages 6-7: Perspectives économiques et Recettes
-- ============================================

-- Table: Prévisions macroéconomiques (Tableau 1, Page 6)
CREATE TABLE previsions_macroeconomiques (
    id BIGSERIAL PRIMARY KEY,
    annee INTEGER NOT NULL UNIQUE,
    pib_nominal_milliards_ar DECIMAL(12, 2) NOT NULL,
    taux_croissance_economique DECIMAL(5, 2) NOT NULL,
    indice_prix_consommation DECIMAL(5, 2) NOT NULL,
    ratio_depenses_publiques_pib DECIMAL(5, 2) NOT NULL,
    solde_global_base_caisse DECIMAL(5, 2) NOT NULL,
    solde_primaire_base_caisse DECIMAL(12, 2) NOT NULL,
    taux_change_dollar_ar DECIMAL(10, 2) NOT NULL,
    taux_change_euro_ar DECIMAL(10, 2) NOT NULL,
    taux_investissement_public DECIMAL(5, 2) NOT NULL,
    taux_investissement_prive DECIMAL(5, 2) NOT NULL,
    taux_pression_fiscale DECIMAL(5, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Croissance sectorielle (Tableau 2, Page 6)
CREATE TABLE croissance_sectorielle (
    id BIGSERIAL PRIMARY KEY,
    annee INTEGER NOT NULL,
    secteur VARCHAR(100) NOT NULL,
    sous_secteur VARCHAR(100),
    taux_variation DECIMAL(5, 2) NOT NULL,
    niveau INTEGER NOT NULL, -- 1=secteur principal, 2=sous-secteur
    ordre_affichage INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_croissance_secteur UNIQUE (annee, secteur, sous_secteur)
);

-- Table: Catégories de recettes (Page 7)
CREATE TABLE categories_recettes (
    id BIGSERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    libelle VARCHAR(100) NOT NULL,
    description TEXT,
    ordre_affichage INTEGER NOT NULL,
    couleur_graphique VARCHAR(7), -- Code couleur hexadécimal
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Recettes par source (Figure 2, Page 7)
CREATE TABLE recettes_totales (
    id BIGSERIAL PRIMARY KEY,
    annee INTEGER NOT NULL,
    categorie_id BIGINT NOT NULL REFERENCES categories_recettes(id),
    montant_milliards_ar DECIMAL(12, 2) NOT NULL,
    pourcentage_total DECIMAL(5, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_recette_annee_categorie UNIQUE (annee, categorie_id)
);

-- Table: Perspectives sectorielles détaillées (Page 6 - texte explicatif)
CREATE TABLE perspectives_sectorielles (
    id BIGSERIAL PRIMARY KEY,
    annee INTEGER NOT NULL,
    secteur VARCHAR(50) NOT NULL,
    taux_croissance DECIMAL(5, 2) NOT NULL,
    description TEXT NOT NULL,
    indicateurs_cles TEXT[], -- Array de texte pour les points clés
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_perspective_annee_secteur UNIQUE (annee, secteur)
);

-- Table: Postes budgétaires autorisés (Page 6)
CREATE TABLE postes_budgetaires_autorises (
    id BIGSERIAL PRIMARY KEY,
    annee INTEGER NOT NULL,
    ministere VARCHAR(200) NOT NULL,
    nombre_postes INTEGER NOT NULL,
    nombre_concours INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_poste_annee_ministere UNIQUE (annee, ministere)
);

-- ============================================
-- INSERTION DES DONNÉES DE L'ANNÉE 2024-2026
-- ============================================

-- Données: Prévisions macroéconomiques
INSERT INTO previsions_macroeconomiques 
(annee, pib_nominal_milliards_ar, taux_croissance_economique, indice_prix_consommation, 
 ratio_depenses_publiques_pib, solde_global_base_caisse, solde_primaire_base_caisse,
 taux_change_dollar_ar, taux_change_euro_ar, taux_investissement_public, 
 taux_investissement_prive, taux_pression_fiscale)
VALUES 
(2024, 78945.4, 4.4, 8.2, 16.2, -4.3, 214.2, 4508.6, 4905.5, 6.1, 14.6, 10.6),
(2025, 88851.6, 5.0, 7.1, 18.4, -4.1, 1097.6, 4688.8, 5275.2, 9.6, 12.0, 11.2),
(2026, 99826.3, 5.2, 7.2, 17.8, -4.1, 866.0, 4853.2, 5532.7, 8.3, 13.7, 11.8);

-- Données: Catégories de recettes
INSERT INTO categories_recettes (code, libelle, description, ordre_affichage, couleur_graphique)
VALUES 
('IMPOTS', 'Impôts', 'Recettes fiscales intérieures', 1, '#3B82F6'),
('DOUANES', 'Douanes', 'Recettes douanières', 2, '#10B981'),
('NON_FISCAL', 'Recettes non fiscales', 'Recettes non fiscales', 3, '#F59E0B'),
('DONS', 'Dons', 'Dons extérieurs', 4, '#8B5CF6');

-- Données: Recettes totales 2024
INSERT INTO recettes_totales (annee, categorie_id, montant_milliards_ar, pourcentage_total)
VALUES 
(2024, (SELECT id FROM categories_recettes WHERE code = 'IMPOTS'), 4636.5, 48.4),
(2024, (SELECT id FROM categories_recettes WHERE code = 'DOUANES'), 3768.0, 39.3),
(2024, (SELECT id FROM categories_recettes WHERE code = 'NON_FISCAL'), 345.8, 3.6),
(2024, (SELECT id FROM categories_recettes WHERE code = 'DONS'), 1086.3, 11.3);

-- Données: Recettes totales 2025
INSERT INTO recettes_totales (annee, categorie_id, montant_milliards_ar, pourcentage_total)
VALUES 
(2025, (SELECT id FROM categories_recettes WHERE code = 'IMPOTS'), 5628.4, 44.6),
(2025, (SELECT id FROM categories_recettes WHERE code = 'DOUANES'), 4366.0, 34.6),
(2025, (SELECT id FROM categories_recettes WHERE code = 'NON_FISCAL'), 491.7, 3.9),
(2025, (SELECT id FROM categories_recettes WHERE code = 'DONS'), 2476.6, 19.6);

-- Données: Croissance sectorielle 2024
INSERT INTO croissance_sectorielle (annee, secteur, sous_secteur, taux_variation, niveau, ordre_affichage)
VALUES 
(2024, 'SECTEUR PRIMAIRE', NULL, 5.3, 1, 1),
(2024, 'SECTEUR PRIMAIRE', 'Agriculture', 6.0, 2, 2),
(2024, 'SECTEUR PRIMAIRE', 'Élevage et pêche', 3.9, 2, 3),
(2024, 'SECTEUR PRIMAIRE', 'Sylviculture', 1.0, 2, 4),
(2024, 'SECTEUR SECONDAIRE', NULL, -3.3, 1, 5),
(2024, 'SECTEUR SECONDAIRE', 'Industrie extractive', -20.8, 2, 6),
(2024, 'SECTEUR SECONDAIRE', 'Alimentaire, boisson, tabac', 0.9, 2, 7),
(2024, 'SECTEUR SECONDAIRE', 'Textile', 31.6, 2, 8),
(2024, 'SECTEUR SECONDAIRE', 'Bois, papiers, imprimerie', 0.4, 2, 9),
(2024, 'SECTEUR SECONDAIRE', 'Matériaux de construction', 7.9, 2, 10),
(2024, 'SECTEUR SECONDAIRE', 'Industrie métallique', 7.2, 2, 11),
(2024, 'SECTEUR SECONDAIRE', 'Machine, matériels électriques', 3.1, 2, 12),
(2024, 'SECTEUR SECONDAIRE', 'Industries diverses', 0.5, 2, 13),
(2024, 'SECTEUR SECONDAIRE', 'Électricité, eau, gaz', 3.9, 2, 14),
(2024, 'SECTEUR TERTIAIRE', NULL, 5.0, 1, 15),
(2024, 'SECTEUR TERTIAIRE', 'BTP', 3.2, 2, 16),
(2024, 'SECTEUR TERTIAIRE', 'Commerce, entretiens, réparations', 4.2, 2, 17),
(2024, 'SECTEUR TERTIAIRE', 'Hôtel, restaurant', 14.7, 2, 18),
(2024, 'SECTEUR TERTIAIRE', 'Transport', 7.0, 2, 19),
(2024, 'SECTEUR TERTIAIRE', 'Poste et télécommunication', 13.4, 2, 20),
(2024, 'SECTEUR TERTIAIRE', 'Banque, assurance', 5.3, 2, 21),
(2024, 'SECTEUR TERTIAIRE', 'Services aux entreprises', 2.3, 2, 22),
(2024, 'SECTEUR TERTIAIRE', 'Administration', 1.7, 2, 23),
(2024, 'SECTEUR TERTIAIRE', 'Éducation', 1.7, 2, 24),
(2024, 'SECTEUR TERTIAIRE', 'Santé', 1.8, 2, 25),
(2024, 'SECTEUR TERTIAIRE', 'Services rendus aux ménages', 1.3, 2, 26);

-- Données: Croissance sectorielle 2025
INSERT INTO croissance_sectorielle (annee, secteur, sous_secteur, taux_variation, niveau, ordre_affichage)
VALUES 
(2025, 'SECTEUR PRIMAIRE', NULL, 7.8, 1, 1),
(2025, 'SECTEUR PRIMAIRE', 'Agriculture', 9.5, 2, 2),
(2025, 'SECTEUR PRIMAIRE', 'Élevage et pêche', 4.0, 2, 3),
(2025, 'SECTEUR PRIMAIRE', 'Sylviculture', 1.1, 2, 4),
(2025, 'SECTEUR SECONDAIRE', NULL, 3.4, 1, 5),
(2025, 'SECTEUR SECONDAIRE', 'Industrie extractive', 4.0, 2, 6),
(2025, 'SECTEUR SECONDAIRE', 'Alimentaire, boisson, tabac', 2.4, 2, 7),
(2025, 'SECTEUR SECONDAIRE', 'Textile', 4.0, 2, 8),
(2025, 'SECTEUR SECONDAIRE', 'Bois, papiers, imprimerie', 0.7, 2, 9),
(2025, 'SECTEUR SECONDAIRE', 'Matériaux de construction', 8.0, 2, 10),
(2025, 'SECTEUR SECONDAIRE', 'Industrie métallique', 7.3, 2, 11),
(2025, 'SECTEUR SECONDAIRE', 'Machine, matériels électriques', 3.2, 2, 12),
(2025, 'SECTEUR SECONDAIRE', 'Industries diverses', 0.6, 2, 13),
(2025, 'SECTEUR SECONDAIRE', 'Électricité, eau, gaz', 4.0, 2, 14),
(2025, 'SECTEUR TERTIAIRE', NULL, 5.4, 1, 15),
(2025, 'SECTEUR TERTIAIRE', 'BTP', 3.6, 2, 16),
(2025, 'SECTEUR TERTIAIRE', 'Commerce, entretiens, réparations', 4.3, 2, 17),
(2025, 'SECTEUR TERTIAIRE', 'Hôtel, restaurant', 14.9, 2, 18),
(2025, 'SECTEUR TERTIAIRE', 'Transport', 7.2, 2, 19),
(2025, 'SECTEUR TERTIAIRE', 'Poste et télécommunication', 13.7, 2, 20),
(2025, 'SECTEUR TERTIAIRE', 'Banque, assurance', 6.1, 2, 21),
(2025, 'SECTEUR TERTIAIRE', 'Services aux entreprises', 2.4, 2, 22),
(2025, 'SECTEUR TERTIAIRE', 'Administration', 1.9, 2, 23),
(2025, 'SECTEUR TERTIAIRE', 'Éducation', 1.8, 2, 24),
(2025, 'SECTEUR TERTIAIRE', 'Santé', 1.9, 2, 25),
(2025, 'SECTEUR TERTIAIRE', 'Services rendus aux ménages', 1.4, 2, 26);

-- Données: Perspectives sectorielles 2025
INSERT INTO perspectives_sectorielles (annee, secteur, taux_croissance, description, indicateurs_cles)
VALUES 
(2025, 'Agriculture', 9.5, 
 'Une augmentation estimée de 9,5%, portée par la production de riz amélioré, qui permettra un rendement de plus de 8 tonnes par hectare.',
 ARRAY['Production de riz amélioré', 'Rendement > 8 tonnes/hectare']),
(2025, 'Industrie extractive', 4.0,
 'Une croissance de 4,0%, en raison de la demande accrue liée aux énergies renouvelables et à la production de batteries pour véhicules électriques.',
 ARRAY['Énergies renouvelables', 'Batteries pour véhicules électriques']),
(2025, 'Secteur tertiaire', 5.4,
 'Une croissance de 5,4%, avec des initiatives visant à attirer davantage de touristes et à développer les infrastructures numériques.',
 ARRAY['Développement touristique', 'Infrastructures numériques', '6 650 postes budgétaires']);

-- Données: Postes budgétaires autorisés 2025
INSERT INTO postes_budgetaires_autorises (annee, ministere, nombre_postes, nombre_concours)
VALUES 
(2025, 'Ministère des Forces Armées', 1000, NULL),
(2025, 'Ministère de la Santé Publique', 300, NULL),
(2025, 'Ministère de la Sécurité Publique', 1000, NULL),
(2025, 'Ministère de l''Éducation Nationale', 3000, 2150),
(2025, 'Ministère de l''Enseignement Technique et de la Formation Professionnelle', 250, NULL),
(2025, 'Ministère de l''Enseignement Supérieur et de la Recherche Scientifique', 100, NULL),
(2025, 'Ministère délégué en charge de la Gendarmerie Nationale', 1000, NULL);

-- ============================================
-- INDEX POUR PERFORMANCES
-- ============================================

CREATE INDEX idx_croissance_annee ON croissance_sectorielle(annee);
CREATE INDEX idx_croissance_secteur ON croissance_sectorielle(secteur);
CREATE INDEX idx_recettes_annee ON recettes_totales(annee);
CREATE INDEX idx_perspectives_annee ON perspectives_sectorielles(annee);
CREATE INDEX idx_postes_annee ON postes_budgetaires_autorises(annee);

-- ============================================
-- VUES UTILES POUR L'APPLICATION
-- ============================================

-- Vue: Résumé macroéconomique par année
CREATE VIEW v_resume_macro AS
SELECT 
    annee,
    pib_nominal_milliards_ar,
    taux_croissance_economique,
    indice_prix_consommation,
    taux_pression_fiscale,
    taux_investissement_public + taux_investissement_prive as taux_investissement_total
FROM previsions_macroeconomiques
ORDER BY annee;

-- Vue: Recettes totales par année avec détails
CREATE VIEW v_recettes_detaillees AS
SELECT 
    r.annee,
    c.code,
    c.libelle,
    r.montant_milliards_ar,
    r.pourcentage_total,
    c.couleur_graphique
FROM recettes_totales r
JOIN categories_recettes c ON r.categorie_id = c.id
ORDER BY r.annee, c.ordre_affichage;

-- Vue: Croissance sectorielle principale (niveau 1)
CREATE VIEW v_croissance_principale AS
SELECT 
    annee,
    secteur,
    taux_variation
FROM croissance_sectorielle
WHERE niveau = 1
ORDER BY annee, ordre_affichage;

-- Vue: Total recettes par année
CREATE VIEW v_total_recettes AS
SELECT 
    annee,
    SUM(montant_milliards_ar) as total_recettes_milliards_ar,
    COUNT(*) as nombre_categories
FROM recettes_totales
GROUP BY annee
ORDER BY annee;

COMMENT ON TABLE previsions_macroeconomiques IS 'Prévisions macroéconomiques (Tableau 1, Page 6)';
COMMENT ON TABLE croissance_sectorielle IS 'Taux de croissance par secteur (Tableau 2, Page 6)';
COMMENT ON TABLE recettes_totales IS 'Recettes totales de l''État (Figure 2, Page 7)';
COMMENT ON TABLE perspectives_sectorielles IS 'Perspectives sectorielles détaillées (Page 6)';
COMMENT ON TABLE postes_budgetaires_autorises IS 'Postes budgétaires autorisés par ministère (Page 6)';