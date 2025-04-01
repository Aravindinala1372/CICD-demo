package api.automation.product;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class GetRunner {
	
	@Test
	public Karate runTest() {

		return Karate.run("Product").relativeTo(getClass());

	}

}
