package finance.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "previsions_macroeconomiques")
public class PrevisionMacroeconomique {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer annee;
    private Double pibNominalMilliardsAr;
    private Double tauxCroissanceEconomique;
    private Double indicePrixConsommation;
    private Double ratioDepensesPubliquesPib;
    private Double soldeGlobalBaseCaisse;
    private Double soldePrimaireBaseCaisse;
    private Double tauxChangeDollarAr;
    private Double tauxChangeEuroAr;
    private Double tauxInvestissementPublic;
    private Double tauxInvestissementPrive;
    private Double tauxPressionFiscale;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // --- Getters et Setters ---
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAnnee() {
        return annee;
    }

    public void setAnnee(Integer annee) {
        this.annee = annee;
    }

    public Double getPibNominalMilliardsAr() {
        return pibNominalMilliardsAr;
    }

    public void setPibNominalMilliardsAr(Double pibNominalMilliardsAr) {
        this.pibNominalMilliardsAr = pibNominalMilliardsAr;
    }

    public Double getTauxCroissanceEconomique() {
        return tauxCroissanceEconomique;
    }

    public void setTauxCroissanceEconomique(Double tauxCroissanceEconomique) {
        this.tauxCroissanceEconomique = tauxCroissanceEconomique;
    }

    public Double getIndicePrixConsommation() {
        return indicePrixConsommation;
    }

    public void setIndicePrixConsommation(Double indicePrixConsommation) {
        this.indicePrixConsommation = indicePrixConsommation;
    }

    public Double getRatioDepensesPubliquesPib() {
        return ratioDepensesPubliquesPib;
    }

    public void setRatioDepensesPubliquesPib(Double ratioDepensesPubliquesPib) {
        this.ratioDepensesPubliquesPib = ratioDepensesPubliquesPib;
    }

    public Double getSoldeGlobalBaseCaisse() {
        return soldeGlobalBaseCaisse;
    }

    public void setSoldeGlobalBaseCaisse(Double soldeGlobalBaseCaisse) {
        this.soldeGlobalBaseCaisse = soldeGlobalBaseCaisse;
    }

    public Double getSoldePrimaireBaseCaisse() {
        return soldePrimaireBaseCaisse;
    }

    public void setSoldePrimaireBaseCaisse(Double soldePrimaireBaseCaisse) {
        this.soldePrimaireBaseCaisse = soldePrimaireBaseCaisse;
    }

    public Double getTauxChangeDollarAr() {
        return tauxChangeDollarAr;
    }

    public void setTauxChangeDollarAr(Double tauxChangeDollarAr) {
        this.tauxChangeDollarAr = tauxChangeDollarAr;
    }

    public Double getTauxChangeEuroAr() {
        return tauxChangeEuroAr;
    }

    public void setTauxChangeEuroAr(Double tauxChangeEuroAr) {
        this.tauxChangeEuroAr = tauxChangeEuroAr;
    }

    public Double getTauxInvestissementPublic() {
        return tauxInvestissementPublic;
    }

    public void setTauxInvestissementPublic(Double tauxInvestissementPublic) {
        this.tauxInvestissementPublic = tauxInvestissementPublic;
    }

    public Double getTauxInvestissementPrive() {
        return tauxInvestissementPrive;
    }

    public void setTauxInvestissementPrive(Double tauxInvestissementPrive) {
        this.tauxInvestissementPrive = tauxInvestissementPrive;
    }

    public Double getTauxPressionFiscale() {
        return tauxPressionFiscale;
    }

    public void setTauxPressionFiscale(Double tauxPressionFiscale) {
        this.tauxPressionFiscale = tauxPressionFiscale;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
