
package service;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.validation.BindingResult;

import services.CreditCardService;
import services.HackerService;
import utilities.AbstractTest;
import domain.CreditCard;
import domain.Hacker;
import forms.RegistrationFormHacker;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class HackerServiceTest extends AbstractTest {

	@Autowired
	private HackerService		hackerService;

	@Autowired
	private CreditCardService	creditCardService;


	/*
	 * a) Requeriment: An actor who is not authenticated must be able to
	 * register to the system as hacker.
	 * 
	 * b) Broken bussines rule:
	 * Se intenta registratar un usuario como company con un patr�n de VatNumber incorrecto
	 * 
	 * c) Sentence coverage:Este caso de uso engloba el recontructor y el save tanto del HackerService como de CreditCardService,
	 * el total de lineas sumando estos metodos es de 134, de las cuales este test recorrer 76 , es decir un 56'72%.
	 * 
	 * d) Data coverage: 7.69% (1 atributo incorrecto/13atributos)
	 */

	@Test
	public void CreateHackerService() {
		final Object testingData[][] = {
			{//Positive test
				"Nuevo Nombre", "Apellido", "ES12345678X", "prueba@email.com", "NuevoUsername", "NuevaPassWord", "NuevaPassWord", "NuevoBrandName", "NuevoholderName", "5182901911816096", 8, 2020, 876, null
			}, {//Negative test: VatNumber con patr�n incorrecto
				"Nuevo Nombre", "Apellido", "ES123456789X", "prueba2@email.com", "NuevoUsername", "NuevaPassWord", "NuevaPassWord", "NuevoBrandName", "NuevoholderName", "5182901911816096", 8, 2020, 876, NullPointerException.class

			},

		};

		for (int i = 0; i < testingData.length; i++)
			this.CreateHackerTemplate((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (String) testingData[i][6],
				(String) testingData[i][7], (String) testingData[i][8], (String) testingData[i][9], (int) testingData[i][10], (int) testingData[i][11], (int) testingData[i][12], (Class<?>) testingData[i][13]);
	}
	protected void CreateHackerTemplate(final String name, final String surnames, final String vatNumber, final String email, final String username, final String password, final String confirmPassword, final String brandName, final String holderName,
		final String number, final int expirationMonth, final int expirationYear, final int cW, final Class<?> expected) {
		Class<?> caught;
		Hacker hacker = null;
		CreditCard creditcard = null;
		caught = null;
		try {

			RegistrationFormHacker registrationForm = new RegistrationFormHacker();

			registrationForm = registrationForm.createToHacker();

			registrationForm.setBrandName(brandName);
			registrationForm.setHolderName(holderName);
			registrationForm.setNumber(number);
			registrationForm.setExpirationMonth(expirationMonth);
			registrationForm.setExpirationYear(expirationYear);
			registrationForm.setCW(cW);

			registrationForm.setName(name);
			registrationForm.setSurnames(surnames);
			registrationForm.setVatNumber(vatNumber);
			registrationForm.setEmail(email);
			registrationForm.getUserAccount().setUsername(username);
			registrationForm.getUserAccount().setPassword(password);
			registrationForm.setPassword(confirmPassword);
			registrationForm.setPhone("");
			registrationForm.setAddress("");
			registrationForm.setPhoto("");

			registrationForm.setCheck(true);

			final BindingResult binding = null;

			creditcard = this.creditCardService.reconstruct(registrationForm, binding);
			registrationForm.setCreditCard(creditcard);
			hacker = this.hackerService.reconstruct(registrationForm, binding);
			final CreditCard creditCardSave = this.creditCardService.save(creditcard);
			hacker.setCreditCard(creditCardSave);
			this.hackerService.save(hacker);

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);
	}

	/*
	 * a) Requeriment: An actor who is authenticated
	 * must be able to edit his or her personal data.
	 * 
	 * b) Broken bussines rule:
	 * Un hacker intenta editar la informacion de otro.
	 * 
	 * c) Sentence coverage:Este caso de uso engloba el recontructor y el save tando del HackerService como del CreditCardService, y al findOne de HackerService,
	 * el total de lineas sumando estos metodos es de 140, de las cuales este test recorrer 83 , es decir un 59'29%.
	 * 
	 * d) Data coverage:
	 */

	@Test
	public void EditHackerService() {
		final Object testingData[][] = {
			{
				//Positive test
				"Nuevo Nombre", "Apellido", "ES12345678X", "prueba@email.com", "NuevaPassWord", "NuevaPassWord", "NuevoBrandName", "NuevoholderName", "5182901911816096", 8, 2020, 876, super.getEntityId("hacker1"), null
			}, {
				//Negative test: Un hacker intenta modificar los datos de otra
				"Nuevo Nombre", "Apellido", "ES12345678X", "prueba@email.com", "NuevaPassWord", "NuevaPassWord", "NuevoBrandName", "NuevoholderName", "5182901911816096", 8, 2020, 876, super.getEntityId("hacker2"), IllegalArgumentException.class

			},

		};

		for (int i = 0; i < testingData.length; i++)
			this.EditHackerTemplate((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (String) testingData[i][6],
				(String) testingData[i][7], (String) testingData[i][8], (int) testingData[i][9], (int) testingData[i][10], (int) testingData[i][11], (int) testingData[i][12], (Class<?>) testingData[i][13]);
	}
	protected void EditHackerTemplate(final String name, final String surnames, final String vatNumber, final String email, final String password, final String confirmPassword, final String brandName, final String holderName, final String number,
		final int expirationMonth, final int expirationYear, final int cW, final int hackerId, final Class<?> expected) {
		Class<?> caught;
		Hacker hacker = null;
		CreditCard creditcard = null;
		caught = null;
		try {
			super.authenticate("hacker");
			RegistrationFormHacker registrationForm = new RegistrationFormHacker();

			registrationForm = registrationForm.createToHacker();

			hacker = this.hackerService.findOne(hackerId);
			registrationForm.setId(hacker.getId());
			registrationForm.setVersion(hacker.getVersion());
			registrationForm.setBrandName(brandName);
			registrationForm.setHolderName(holderName);
			registrationForm.setNumber(number);
			registrationForm.setExpirationMonth(expirationMonth);
			registrationForm.setExpirationYear(expirationYear);
			registrationForm.setCW(cW);

			registrationForm.setName(name);
			registrationForm.setSurnames(surnames);
			registrationForm.setVatNumber(vatNumber);
			registrationForm.setEmail(email);
			registrationForm.getUserAccount().setUsername(hacker.getUserAccount().getUsername());
			registrationForm.getUserAccount().setPassword(password);
			registrationForm.setPassword(confirmPassword);
			registrationForm.setPhone("");
			registrationForm.setAddress("");
			registrationForm.setPhoto("");

			final BindingResult binding = null;

			creditcard = this.creditCardService.reconstruct(registrationForm, binding);
			registrationForm.setCreditCard(creditcard);
			hacker = this.hackerService.reconstruct(registrationForm, binding);
			final CreditCard creditCardSave = this.creditCardService.save(creditcard);
			hacker.setCreditCard(creditCardSave);
			this.hackerService.save(hacker);

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);
	}

}
