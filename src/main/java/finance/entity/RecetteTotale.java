package finance.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "recettes_totales")
public class RecetteTotale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer annee;

    @ManyToOne
    @JoinColumn(name = "categorie_id")
    private CategorieRecette categorie;

    private Double montantMilliardsAr;
    private Double pourcentageTotal;
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

    public CategorieRecette getCategorie() {
        return categorie;
    }

    public void setCategorie(CategorieRecette categorie) {
        this.categorie = categorie;
    }

    public Double getMontantMilliardsAr() {
        return montantMilliardsAr;
    }

    public void setMontantMilliardsAr(Double montantMilliardsAr) {
        this.montantMilliardsAr = montantMilliardsAr;
    }

    public Double getPourcentageTotal() {
        return pourcentageTotal;
    }

    public void setPourcentageTotal(Double pourcentageTotal) {
        this.pourcentageTotal = pourcentageTotal;
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
