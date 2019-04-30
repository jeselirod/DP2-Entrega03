
package repositories;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Audit;

@Repository
public interface AuditRepository extends JpaRepository<Audit, Integer> {

	@Query("select a from Audit a where a.auditor.id=?1")
	public Collection<Audit> getAuditsByAuditor(Integer auditorId);

	@Query("select avg(a.score), min(a.score), max(a.score), sqrt(sum(a.score * a.score)/count(a)-avg(a.score)*avg(a.score)) from Audit a")
	public List<Object[]> getAvgMinMaxDesvScoreOfAudit();

}
