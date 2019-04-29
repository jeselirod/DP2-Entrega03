
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Provider extends Actor {

	private String	make;


	@NotBlank
	@NotNull
	public String getMake() {
		return this.make;
	}

	public void setMake(final String make) {
		this.make = make;
	}
}
