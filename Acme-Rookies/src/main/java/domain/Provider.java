
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.SafeHtml;

@Entity
@Access(AccessType.PROPERTY)
public class Provider extends Actor {

	private String	make;


	@SafeHtml(whitelistType = SafeHtml.WhiteListType.NONE)
	@NotBlank
	@NotNull
	public String getMake() {
		return this.make;
	}

	public void setMake(final String make) {
		this.make = make;
	}
}
