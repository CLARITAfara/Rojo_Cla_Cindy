package finance.repository;


import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

import finance.entity.PrevisionsAnnuelles;
import finance.dto.PrevisionDTO;

@Repository
public interface PrevisionsAnnuellesRepository extends JpaRepository<PrevisionsAnnuelles, Long> {

	@Query("SELECT new finance.dto.PrevisionDTO(n.nomImpot, p.anneeFiscale, p.montant) " +
		   "FROM PrevisionsAnnuelles p JOIN p.natureImpot n " +
		   "ORDER BY p.anneeFiscale, n.idImpot")
	List<PrevisionDTO> findAllAsDtoOrdered();

}
