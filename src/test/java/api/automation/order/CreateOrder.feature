Feature: To create new order in application
  Use POST /orders

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    # Retrieve cartId from file
    * def cartId = read('file:/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/cartId.txt')
    # Retrieve access token from file
    * def accessToken = read('src/test/java/api/automation/accessToken.txt')


  Scenario Outline: Create new order in application
    Given path '/orders'
    And request { cartId: "#(cartId)", customerName: <customerName> }
    And header Authorization = 'Bearer ' + accessToken
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
    * def filePath = '/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/orderId.txt'
    * def orderId = response.orderId
    * writeToFile(orderId, filePath)
    And match response.created == true
    * match response == { created: '#boolean', orderId: '#string' }
    * match response.orderId != '' 
    And print response
    * def orderId = response.orderId
    And print "orderId: ",orderId
    

    Examples: 
      | customerName      |
      | "Shreyash Chavan" |
