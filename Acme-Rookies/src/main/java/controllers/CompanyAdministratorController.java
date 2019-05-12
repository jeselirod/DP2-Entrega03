
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.CompanyService;
import domain.Company;

@Controller
@RequestMapping("/company/administrator/")
public class CompanyAdministratorController extends AbstractController {

	@Autowired
	private CompanyService	companyService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView listCompanies() {
		ModelAndView result;

		final Collection<Company> companies = this.companyService.findAll();

		result = new ModelAndView("company/list");
		result.addObject("companies", companies);

		return result;
	}

}
