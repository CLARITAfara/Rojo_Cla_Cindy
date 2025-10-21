package finance.entity;

import jakarta.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "Nature_Impots")
public class NatureImpots {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_impot")
	private Long idImpot;

	@Column(name = "nom_impot", nullable = false, unique = true, length = 100)
	private String nomImpot;

	public NatureImpots() {
	}

	public NatureImpots(Long idImpot, String nomImpot) {
		this.idImpot = idImpot;
		this.nomImpot = nomImpot;
	}

	public NatureImpots(String nomImpot) {
		this.nomImpot = nomImpot;
	}

	public Long getIdImpot() {
		return idImpot;
	}

	public void setIdImpot(Long idImpot) {
		this.idImpot = idImpot;
	}

	public String getNomImpot() {
		return nomImpot;
	}

	public void setNomImpot(String nomImpot) {
		this.nomImpot = nomImpot;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NatureImpots that = (NatureImpots) o;
		if (idImpot != null && that.idImpot != null) {
			return Objects.equals(idImpot, that.idImpot);
		}
		return Objects.equals(nomImpot, that.nomImpot);
	}

	@Override
	public int hashCode() {
		return Objects.hash(idImpot != null ? idImpot : nomImpot);
	}

	@Override
	public String toString() {
		return "NatureImpots{" +
				"idImpot=" + idImpot +
				", nomImpot='" + nomImpot + '\'' +
				'}';
	}

}
