Feature: check the Status of API

  Background: 
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: check if the api is running
    Given path '/status'
    When method get
    Then status 200
    And match response.status == 'UP'