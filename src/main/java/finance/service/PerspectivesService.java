package finance.service;

import org.springframework.stereotype.Service;
import java.util.List;

import finance.entity.*;
import finance.repository.*;

@Service
public class PerspectivesService {

    private final PrevisionMacroeconomiqueRepository previsionRepo;
    private final CroissanceSectorielleRepository croissanceRepo;
    private final PerspectiveSectorielleRepository perspectiveRepo;
    private final PosteBudgetaireRepository posteRepo;

    public PerspectivesService(
        PrevisionMacroeconomiqueRepository previsionRepo,
        CroissanceSectorielleRepository croissanceRepo,
        PerspectiveSectorielleRepository perspectiveRepo,
        PosteBudgetaireRepository posteRepo
    ) {
        this.previsionRepo = previsionRepo;
        this.croissanceRepo = croissanceRepo;
        this.perspectiveRepo = perspectiveRepo;
        this.posteRepo = posteRepo;
    }

    // 🔹 Prévisions macroéconomiques d'une année donnée
    public PrevisionMacroeconomique getPrevisionByAnnee(int annee) {
        return previsionRepo.findByAnnee(annee);
    }

    // 🔹 Croissance sectorielle pour une année donnée
    public List<CroissanceSectorielle> getCroissanceByAnnee(int annee) {
        return croissanceRepo.findByAnneeOrderByOrdreAffichage(annee);
    }

    // 🔹 Perspectives détaillées
    public List<PerspectiveSectorielle> getPerspectivesByAnnee(int annee) {
        return perspectiveRepo.findByAnnee(annee);
    }

    // 🔹 Postes budgétaires autorisés
    public List<PosteBudgetaireAutorise> getPostesByAnnee(int annee) {
        return posteRepo.findByAnnee(annee);
    }
}
