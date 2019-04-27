
package repositories;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Curricula;

@Repository
public interface CurriculaRepository extends JpaRepository<Curricula, Integer> {

	@Query("select c from Curricula c where c.hacker.id=?1")
	public Collection<Curricula> getCurriculasByHacker(Integer hackerId);

	@Query("select c from Curricula c where c.personalData.id=?1")
	public Curricula getCurriculaByPersonalData(Integer id);

	@Query("select c from Curricula c where ?1 member of c.positionData")
	public Curricula getCurriculaByPositionData(Integer id);

	@Query("select c from Curricula c where ?1 member of c.educationData")
	public Curricula getCurriculaByEducationData(Integer id);

	@Query("select c from Curricula c where ?1 member of c.miscellaneousData")
	public Curricula getCurriculaByMiscellaneousData(Integer id);

	@Query("select min(1.0*(select count(c) from Curricula c where c.hacker.id=h.id)),max(1.0*(select count(c) from Curricula c where c.hacker.id=h.id)),avg(1.0*(select count(c) from Curricula c where c.hacker.id=h.id)), sqrt(1.0*sum(1.0*(select count(c) from Curricula c where c.hacker.id=h.id) * (select count(c) from Curricula c where c.hacker.id=h.id)) / count(h) - avg(1.0*(select count(c) from Curricula c where c.hacker.id=h.id)) * avg(1.0*(select count(c) from Curricula c where c.hacker.id=h.id))) from Hacker h")
	public List<Double> getMinMaxAvgDesvCurriculaPerHacker();

}
