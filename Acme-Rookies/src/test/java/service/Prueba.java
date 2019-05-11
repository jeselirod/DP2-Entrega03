
package service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class Prueba extends AbstractTest {

	@Test
	public void test() {
		System.out.println(new Date());

	}

	public Boolean test(final Date date) {
		final Boolean res = true;
		final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

		final String fecha = format.format(date);

		return res;

	}

}
