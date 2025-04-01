Feature: To test the single order created by the API client.
  use GET /orders/:orderId

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def accessToken = read('classpath:api/automation/accessToken.txt')
    * def orderId =  read('file:/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/orderId.txt')  
    * print orderId

  Scenario: To get the single order created by api client
    Given path '/orders/' + orderId
    And param invoice = true
    And header Authorization = 'Bearer ' + accessToken
    When method get
    Then status 200
    And print response
