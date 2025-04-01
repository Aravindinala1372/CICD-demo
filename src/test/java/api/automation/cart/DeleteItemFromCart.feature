Feature: Delete an item in the cart

  Background: 
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def cartId = read('CartId.txt')
    * def itemId = read('itemId.txt')

  Scenario: Delete an item in the cart
    Given path '/carts/' + cartId + '/items/' + itemId
    And header Accept = 'application/json'
    And request
    When method delete
    Then status 204
