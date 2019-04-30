
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import security.LoginService;
import security.UserAccount;
import services.AuditService;
import services.AuditorService;
import domain.Audit;
import domain.Auditor;

@Controller
@RequestMapping("/audit/auditor")
public class AuditAuditorController extends AbstractController {

	@Autowired
	private AuditService	auditService;
	@Autowired
	private AuditorService	auditorService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		final ModelAndView result;
		final Collection<Audit> audits;

		final UserAccount user = LoginService.getPrincipal();
		final Auditor a = this.auditorService.auditorUserAccount(user.getId());

		audits = this.auditService.getAuditsByAuditor(a.getId());
		Assert.notNull(audits);

		result = new ModelAndView("audit/list");
		result.addObject("audits", audits);

		return result;
	}
}
