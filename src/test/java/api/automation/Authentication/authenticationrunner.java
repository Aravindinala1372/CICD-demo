package api.automation.Authentication;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;
public class authenticationrunner {
    @Test
	public Karate runTest() {

		return Karate.run("Authentication").relativeTo(getClass());

	}
}
