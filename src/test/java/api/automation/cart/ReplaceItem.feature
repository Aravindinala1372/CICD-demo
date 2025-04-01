Feature: Replace an item in the cart

  Background: 
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def cartId = read('CartId.txt')
    * def itemId = read('itemId.txt')

  Scenario: Modify an item in the cart
    Given path '/carts/' + cartId + '/items/' + itemId
    And header Accept = 'application/json'
    And request
      """
       {
        "productId": 9482,
        "quantity": 6
      }
      """
    When method put
    Then status 204
