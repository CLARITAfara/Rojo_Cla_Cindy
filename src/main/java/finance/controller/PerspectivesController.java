package finance.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import java.util.List;

import finance.entity.*;
import finance.service.PerspectivesService;

@RestController
@RequestMapping("/api/perspectives")
public class PerspectivesController {

    private final PerspectivesService perspectivesService;

    public PerspectivesController(PerspectivesService perspectivesService) {
        this.perspectivesService = perspectivesService;
    }

    // 🔹 Récupérer la prévision macroéconomique d'une année donnée
    @GetMapping("/prevision/{annee}")
    public ResponseEntity<PrevisionMacroeconomique> getPrevision(@PathVariable int annee) {
        PrevisionMacroeconomique prevision = perspectivesService.getPrevisionByAnnee(annee);
        if (prevision != null) {
            return ResponseEntity.ok(prevision);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 🔹 Récupérer la croissance sectorielle pour une année donnée
    @GetMapping("/croissance/{annee}")
    public ResponseEntity<List<CroissanceSectorielle>> getCroissance(@PathVariable int annee) {
        List<CroissanceSectorielle> croissance = perspectivesService.getCroissanceByAnnee(annee);
        if (!croissance.isEmpty()) {
            return ResponseEntity.ok(croissance);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 🔹 Récupérer les perspectives sectorielles détaillées pour une année
    @GetMapping("/secteur/{annee}")
    public ResponseEntity<List<PerspectiveSectorielle>> getPerspectives(@PathVariable int annee) {
        List<PerspectiveSectorielle> perspectives = perspectivesService.getPerspectivesByAnnee(annee);
        if (!perspectives.isEmpty()) {
            return ResponseEntity.ok(perspectives);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 🔹 Récupérer les postes budgétaires autorisés pour une année
    @GetMapping("/postes/{annee}")
    public ResponseEntity<List<PosteBudgetaireAutorise>> getPostes(@PathVariable int annee) {
        List<PosteBudgetaireAutorise> postes = perspectivesService.getPostesByAnnee(annee);
        if (!postes.isEmpty()) {
            return ResponseEntity.ok(postes);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
