Feature: Adding item to cart

  Background: 
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def cartId = read('file:/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/cartId.txt')

  Scenario Outline: Adding an item to the cart
    Given path '/carts/' + cartId + '/items'
    And header Accept = 'application/json'
    And request
      """
      {
        "productId": <productId>,
        "quantity": <quantity>
      }
      """
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
      writer.write(String(data)); // Convert data to string before writing
      writer.close();
    }
    """
    
    # Define the file path for the output text file
    * def filePath = '/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/itemId.txt'
    * def itemId = response.itemId
    * writeToFile(itemId, filePath)
    * print itemId
    * match response == { created: '#boolean', itemId: '#number' }
    * match response.created == true
    

    Examples: 
      | productId | quantity |
      |      4646 |        2 |

