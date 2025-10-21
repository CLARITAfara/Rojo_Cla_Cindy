package finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import finance.entity.PerspectiveSectorielle;
import java.util.List;

@Repository
public interface PerspectiveSectorielleRepository extends JpaRepository<PerspectiveSectorielle, Long> {
    List<PerspectiveSectorielle> findByAnnee(Integer annee);
}
