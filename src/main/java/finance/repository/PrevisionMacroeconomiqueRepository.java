package finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import finance.entity.PrevisionMacroeconomique;

@Repository
public interface PrevisionMacroeconomiqueRepository extends JpaRepository<PrevisionMacroeconomique, Long> {
    PrevisionMacroeconomique findByAnnee(Integer annee);
}
