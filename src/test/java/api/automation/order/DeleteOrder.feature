Feature: To delete an order created by the API client.
  use DELETE /orders/:orderId

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def accessToken = read('classpath:api/automation/accessToken.txt')
    * def orderId =  read('file:/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/orderId.txt') 

  Scenario: To delete an order created by the API client
    Given path '/orders/' + orderId
    And header Authorization = 'Bearer ' + accessToken
    When method delete
    Then status 204
    And print response
