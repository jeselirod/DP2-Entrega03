
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.PersonalData;

@Component
@Transactional
public class PersonalDataToStringConverter implements Converter<PersonalData, String> {

	@Override
	public String convert(final PersonalData profileData) {
		String result;

		if (profileData == null)
			result = null;
		else
			result = String.valueOf(profileData.getId());

		return result;
	}

}
