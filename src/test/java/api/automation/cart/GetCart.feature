Feature: To test the carts endpoint of grocery api
    Use GET /carts/:cartId to get the cart

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    # * def filePath = 'src/test/java/api/automation/response.txt'
    * def cartId = read('file:/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/cartId.txt')


    

  Scenario: Retrieve the cart using the cartId
    Given path '/carts/' + cartId
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match each response.items == { id: '#number', productId: '#number', quantity: '#number' }
    * print 'Cart ID in get cart:', cartId
