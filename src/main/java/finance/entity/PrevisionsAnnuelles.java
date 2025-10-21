package finance.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "Previsions_Annuelles")
public class PrevisionsAnnuelles {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_prevision")
	private Long idPrevision;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_impot", nullable = false)
	private NatureImpots natureImpot;

	@Column(name = "annee_fiscale")
	private LocalDate anneeFiscale;

	@Column(name = "montant", precision = 10, scale = 2)
	private BigDecimal montant;

	public PrevisionsAnnuelles() {
	}

	public PrevisionsAnnuelles(NatureImpots natureImpot, LocalDate anneeFiscale, BigDecimal montant) {
		this.natureImpot = natureImpot;
		this.anneeFiscale = anneeFiscale;
		this.montant = montant;
	}

	public Long getIdPrevision() {
		return idPrevision;
	}

	public void setIdPrevision(Long idPrevision) {
		this.idPrevision = idPrevision;
	}

	public NatureImpots getNatureImpot() {
		return natureImpot;
	}

	public void setNatureImpot(NatureImpots natureImpot) {
		this.natureImpot = natureImpot;
	}

	public LocalDate getAnneeFiscale() {
		return anneeFiscale;
	}

	public void setAnneeFiscale(LocalDate anneeFiscale) {
		this.anneeFiscale = anneeFiscale;
	}

	public BigDecimal getMontant() {
		return montant;
	}

	public void setMontant(BigDecimal montant) {
		this.montant = montant;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		PrevisionsAnnuelles that = (PrevisionsAnnuelles) o;
		return Objects.equals(idPrevision, that.idPrevision);
	}

	@Override
	public int hashCode() {
		return Objects.hash(idPrevision);
	}

	@Override
	public String toString() {
		return "PrevisionsAnnuelles{" +
				"idPrevision=" + idPrevision +
				", natureImpot=" + (natureImpot != null ? natureImpot.getNomImpot() : null) +
				", anneeFiscale=" + anneeFiscale +
				", montant=" + montant +
				'}';
	}

}
