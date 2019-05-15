/*
 * AdministratorController.java
 * 
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import security.LoginService;
import services.AuditorService;
import services.CreditCardService;
import services.CustomizableSystemService;
import services.PositionService;
import domain.Auditor;
import domain.Position;

@Controller
@RequestMapping("/auditor")
public class AuditorController extends AbstractController {

	@Autowired
	private AuditorService				auditorService;

	@Autowired
	private CreditCardService			creditCardService;

	@Autowired
	private CustomizableSystemService	customizableService;

	@Autowired
	private PositionService				positionService;


	// Constructors -----------------------------------------------------------

	public AuditorController() {
		super();
	}
	@RequestMapping(value = "/assing-position", method = RequestMethod.GET)
	public ModelAndView editAuditor() {
		ModelAndView result;

		Auditor auditor;

		Collection<Position> allPositions;
		Collection<Position> positionAssing;
		Collection<Position> positionsMe;

		try {
			allPositions = this.positionService.findAll();
			positionAssing = this.positionService.getAllPositionAssing();
			final boolean eliminar = allPositions.removeAll(positionAssing);

			auditor = this.auditorService.findOne(this.auditorService.auditorUserAccount(LoginService.getPrincipal().getId()).getId());
			positionsMe = auditor.getPositions();
			final boolean añadir = allPositions.addAll(positionsMe);

			result = new ModelAndView("auditor/assingPositions");
			result.addObject("positions", allPositions);
			result.addObject("auditor", auditor);

		} catch (final Exception e) {
			result = new ModelAndView("redirect:../../");
		}
		return result;

	}

	@RequestMapping(value = "/assing-position", method = RequestMethod.POST, params = "save")
	public ModelAndView editAuditor(@ModelAttribute("positions") final Collection<Position> positions, final BindingResult binding) {
		ModelAndView result;

		try {
			final Auditor auditor = this.auditorService.findOne(this.auditorService.auditorUserAccount(LoginService.getPrincipal().getId()).getId());
			if (!auditor.getPositions().equals(positions)) {
				auditor.getPositions().clear();
				auditor.setPositions(positions);
				this.auditorService.save(auditor);
			}
			result = new ModelAndView("redirect:../");

		} catch (final Exception e) {

			result = new ModelAndView("auditor/assing-position");

			result.addObject("exception", e);
			result.addObject("positions", positions);

		}
		return result;

	}

}
