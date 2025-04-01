package api.automation.status;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class StatusRunner {
	@Test
	public Karate runTest() {

		return Karate.run("status").relativeTo(getClass());

	}
}
