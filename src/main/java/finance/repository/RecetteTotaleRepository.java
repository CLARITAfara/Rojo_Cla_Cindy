package finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import finance.entity.RecetteTotale;
import java.util.List;

@Repository
public interface RecetteTotaleRepository extends JpaRepository<RecetteTotale, Long> {
    List<RecetteTotale> findByAnnee(Integer annee);
}
