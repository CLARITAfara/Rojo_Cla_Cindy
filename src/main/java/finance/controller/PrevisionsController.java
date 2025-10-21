package finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import finance.service.PrevisionsAnnuellesService;

@Controller
public class PrevisionsController {

    private final PrevisionsAnnuellesService service;

    public PrevisionsController(PrevisionsAnnuellesService service) {
        this.service = service;
    }

    @GetMapping("/previsions")
    public String listPrevisions(Model model) {
        model.addAttribute("previsions", service.getAllPrevisions());
        return "previsions";
    }

}
