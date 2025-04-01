package api.automation;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class mainrunner {
	@Test
	public Karate runTest() {

		return Karate.run("main").relativeTo(getClass());

	}
}
