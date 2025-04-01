Feature: check the Product endpoint

  Background: 
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: Get all the product from the Store
    Given path '/products'
    When method get
    Then status 200
    * def expectedResponse = read('response.json')
    And match response == expectedResponse
    * match response == '#[20]' 
    * match each response == { id: '#number', category: '#string', name: '#string', inStock: '#boolean' }

  Scenario: Get a specific product by ID
    * def productId = 4643
    Given path '/products', productId
    When method get
    Then status 200
    And match response.id == productId
    And match response.category == 'coffee'
    And match response.name == 'Starbucks Coffee Variety Pack, 100% Arabica'
    And match response.inStock == true
