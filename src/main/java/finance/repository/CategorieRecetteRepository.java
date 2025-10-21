package finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import finance.entity.CategorieRecette;

@Repository
public interface CategorieRecetteRepository extends JpaRepository<CategorieRecette, Long> {
}
