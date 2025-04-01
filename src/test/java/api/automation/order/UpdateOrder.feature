Feature: To update an order created by the API client.
  use PATCH /orders/:orderId

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def accessToken = read('file:/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/accessToken.txt') 
    * def orderId =  read('file:/home/runner/work/DemoOf_CI-CD/DemoOf_CI-CD/target/test-classes/api/automation/orderId.txt') 

  Scenario Outline: To update an order created by the API client
    Given path '/orders/' + orderId
    And header Authorization = 'Bearer ' + accessToken
    And request {"customerName":<customerName>,"comment":<comment>}
    When method patch
    Then status 204
    And print response

    Examples: 
      | customerName  | comment                    |
      | "John Watson" | "Customer name updated..." |
