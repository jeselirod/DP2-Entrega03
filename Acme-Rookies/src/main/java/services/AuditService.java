
package services;

import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.AuditRepository;
import repositories.AuditorRepository;
import security.LoginService;
import security.UserAccount;
import domain.Audit;
import domain.Auditor;
import domain.Position;

@Service
@Transactional
public class AuditService {

	@Autowired
	private AuditRepository		auditRepository;
	@Autowired
	private ActorService		actorS;
	@Autowired
	private AuditorRepository	auditorRepository;


	public Audit create() {
		final Audit audit = new Audit();
		final UserAccount user = this.actorS.getActorLogged().getUserAccount();
		audit.setMoment(new Date());
		audit.setScore(0);
		audit.setText("");
		audit.setDraftMode(0);
		audit.setPosition(new Position());
		audit.setAuditor(this.auditorRepository.auditorUserAccount(user.getId()));
		return audit;
	}

	public Collection<Audit> findAll() {
		return this.auditRepository.findAll();
	}

	public Audit findOne(final Integer auditId) {
		final Audit audit = this.auditRepository.findOne(auditId);
		final UserAccount userAccount = LoginService.getPrincipal();
		final Auditor auditor = this.auditorRepository.auditorUserAccount(userAccount.getId());
		Assert.isTrue(userAccount.getAuthorities().iterator().next().getAuthority().equals("AUDITOR"));
		Assert.isTrue(audit.getAuditor() == auditor);

		return audit;
	}

	public Audit save(final Audit audit) {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.isTrue(userAccount.getAuthorities().iterator().next().getAuthority().equals("AUDITOR"));
		Assert.isTrue(audit.getAuditor().equals(this.auditorRepository.auditorUserAccount(userAccount.getId())));
		if (audit.getId() != 0) {
			final Audit old = this.findOne(audit.getId());
			Assert.isTrue(old.getDraftMode() == 1);
		}
		final Audit auditSave = this.auditRepository.save(audit);
		return auditSave;
	}

	public void delete(final Audit audit) {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.isTrue(userAccount.getAuthorities().iterator().next().getAuthority().equals("AUDITOR"));
		Assert.isTrue(audit.getAuditor().equals(this.auditorRepository.auditorUserAccount(userAccount.getId())));
		Assert.isTrue(audit.getDraftMode() == 1);
		this.auditRepository.delete(audit);
	}

	public Collection<Audit> getAuditsByAuditor(final Integer auditorId) {
		return this.auditRepository.getAuditsByAuditor(auditorId);
	}

}
