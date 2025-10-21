package finance.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

import finance.dto.PrevisionDTO;
import finance.repository.PrevisionsAnnuellesRepository;

@Service
@Transactional(readOnly = true)
public class PrevisionsAnnuellesService {

	private final PrevisionsAnnuellesRepository repository;

	public PrevisionsAnnuellesService(PrevisionsAnnuellesRepository repository) {
		this.repository = repository;
	}

	public List<PrevisionDTO> getAllPrevisions() {
		return repository.findAllAsDtoOrdered();
	}

}
