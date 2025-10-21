package finance.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public class PrevisionDTO {

    private String nomImpot;
    private LocalDate anneeFiscale;
    private BigDecimal montant;

    public PrevisionDTO(String nomImpot, LocalDate anneeFiscale, BigDecimal montant) {
        this.nomImpot = nomImpot;
        this.anneeFiscale = anneeFiscale;
        this.montant = montant;
    }

    public String getNomImpot() {
        return nomImpot;
    }

    public LocalDate getAnneeFiscale() {
        return anneeFiscale;
    }

    public BigDecimal getMontant() {
        return montant;
    }
}
