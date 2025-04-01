package api.automation.cart;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class CartRunner {
	@Test
	public Karate runTest() {

		return Karate.run("ChangeItemQuantity").relativeTo(getClass());

	}
}
