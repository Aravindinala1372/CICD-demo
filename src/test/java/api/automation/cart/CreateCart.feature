Feature: Check the cart endpoint

  Background: 
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: Create a new cart
    Given path '/carts'
    When method post
    Then status 201
    * def writeToFile =
    """
    function(data, path) {
      var File = Java.type('java.io.File');
      var PrintWriter = Java.type('java.io.PrintWriter');
      var file = new File(path);
      file.getParentFile().mkdirs(); // Create parent directories if needed
      var writer = new PrintWriter(file); // Overwrites the file by default
      writer.write(data);
      writer.close();
    }
    """
    # Define the file path for the output text file
    * def filePath = '/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/cartId.txt'
    * def cartId = response.cartId
    * writeToFile(cartId, filePath)
    * print 'Response has been written to:', filePath
    And match response.created == true
    And match response contains { cartId: '#notnull' }
    # * def cartId = response.cartId
    * match response == { created: '#boolean', cartId: '#string' }
    # * karate.set('cartId', cartId) 
    # * eval return { cartId: cartId }
