package api.automation.order;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class orderrunner {
	@Test
	public Karate runTest() {

		return Karate.run("CreateOrder").relativeTo(getClass());

	}
}
