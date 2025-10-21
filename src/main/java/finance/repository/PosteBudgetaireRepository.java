package finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import finance.entity.PosteBudgetaireAutorise;
import java.util.List;

@Repository
public interface PosteBudgetaireRepository extends JpaRepository<PosteBudgetaireAutorise, Long> {
    List<PosteBudgetaireAutorise> findByAnnee(Integer annee);
}
