package finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import finance.entity.CroissanceSectorielle;
import java.util.List;

@Repository
public interface CroissanceSectorielleRepository extends JpaRepository<CroissanceSectorielle, Long> {
    List<CroissanceSectorielle> findByAnneeOrderByOrdreAffichage(Integer annee);
}
