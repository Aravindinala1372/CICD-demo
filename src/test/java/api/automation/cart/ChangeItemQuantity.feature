Feature: Modify an item in the cart

  Background: 
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def cartId = read('CartId.txt')
    * def itemId = read('itemId.txt')
    * print itemId

  Scenario: Modify an item in the cart
    Given path '/carts/' + cartId + '/items/' + itemId
    And header Accept = 'application/json'
    And request
      """
      {
        "quantity": 5
      }
      """
    When method patch
    Then status 204
