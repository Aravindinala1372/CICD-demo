Feature: To automate the tests

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'


  Scenario: To check status of the api
    Given call read("classpath:api/automation/status/status.feature")
    # PRODUCTS
  Scenario: get single product
    And call read("classpath:api/automation/product/Product.feature")
  Scenario: get all product
    And call read("classpath:api/automation/product/GetAllProduct.feature")
    # CART
  Scenario: create the cart
    And call read("classpath:api/automation/cart/CreateCart.feature")
  Scenario: get the cart
    And call read("classpath:api/automation/cart/GetCart.feature")
  Scenario: add Item to the cart
    And call read("classpath:api/automation/cart/addItemToCart.feature")
  
  Scenario: get cart item
    And call read("classpath:api/automation/cart/GetCartItem.feature")
    # And call read("classpath:api/automation/cart/ChangeItemQuantity.feature")
    # And call read("classpath:api/automation/cart/ReplaceItem.feature")
    # And call read("classpath:api/automation/cart/DeleteItemFromCart.feature")
    # ORDERS
  Scenario: create order
    And call read("classpath:api/automation/order/CreateOrder.feature")
  
  Scenario: get single order
    And call read("classpath:api/automation/order/GetSingleOrder.feature")
  Scenario: update  order
    And call read("classpath:api/automation/order/UpdateOrder.feature")
  
  Scenario: delete order
    And call read("classpath:api/automation/order/DeleteOrder.feature")
