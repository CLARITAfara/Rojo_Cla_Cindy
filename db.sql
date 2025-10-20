CREATE TABLE Previsions_Recettes_Fiscales (
    id SERIAL PRIMARY KEY,
    nature_impot VARCHAR(100) NOT NULL UNIQUE,
    montant_lfr_2024 NUMERIC(10, 1) NOT NULL,
    montant_lf_2025 NUMERIC(10, 1) NOT NULL
);