Feature: To test the products endpoint of grocery api

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: To get the list of all products from grocery api
    Given path '/products'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match response == '#[20]'
    * match each response == { id: '#number', category: '#string', name: '#string', inStock: '#boolean' }
    And print response
