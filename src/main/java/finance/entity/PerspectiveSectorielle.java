package finance.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(
    name = "perspectives_sectorielles",
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"annee", "secteur"})
    }
)
public class PerspectiveSectorielle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer annee;

    private String secteur;

    @Column(name = "taux_croissance", precision = 5)
    private Double tauxCroissance;

    @Column(columnDefinition = "TEXT")
    private String description;

    // PostgreSQL permet les tableaux de texte, qu'on peut mapper comme List<String>
    @ElementCollection
    @CollectionTable(
        name = "perspective_indicateurs",
        joinColumns = @JoinColumn(name = "perspective_id")
    )
    @Column(name = "indicateur")
    private List<String> indicateursCles;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // --- Getters & Setters ---

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

    public String getSecteur() {
        return secteur;
    }

    public void setSecteur(String secteur) {
        this.secteur = secteur;
    }

    public Double getTauxCroissance() {
        return tauxCroissance;
    }

    public void setTauxCroissance(Double tauxCroissance) {
        this.tauxCroissance = tauxCroissance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getIndicateursCles() {
        return indicateursCles;
    }

    public void setIndicateursCles(List<String> indicateursCles) {
        this.indicateursCles = indicateursCles;
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
