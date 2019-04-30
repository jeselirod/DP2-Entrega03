
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Company extends Actor {

	private String	nameCompany;
	private Integer	totalScore;


	public Integer getTotalScore() {
		return this.totalScore;
	}

	public void setTotalScore(final Integer totalScore) {
		this.totalScore = totalScore;
	}

	@NotBlank
	@Length(min = 4)
	public String getNameCompany() {
		return this.nameCompany;
	}

	public void setNameCompany(final String nameCompany) {
		this.nameCompany = nameCompany;
	}

}
