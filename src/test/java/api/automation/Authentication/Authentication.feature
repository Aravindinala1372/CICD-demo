Feature: create authentication token

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario Outline: Register new API Client
    Given path '/api-clients'
    And header Accept = 'application/json'
    And request {"clientName":<clientName> , "clientEmail":<clientEmail>}
    When method post
    And status 201
    * def writeToFile =
    """
    function(data, path) {
      var File = Java.type('java.io.File');
      var PrintWriter = Java.type('java.io.PrintWriter');
      var file = new File(path);
      file.getParentFile().mkdirs(); // Create parent directories if needed
      var writer = new PrintWriter(file); // Overwrites the file by default
      writer.write(String(data)); // Convert data to string before writing
      writer.close();
    }
    """
    
    # Define the file path for the output text file
    * def filePath = 'src/test/java/api/automation/accessToken.txt'
    * def accessToken = response.accessToken
    * writeToFile(accessToken, filePath)
    And print response
    * def accessToken = response.accessToken
    And print "Access Token: ",accessToken


    Examples: 
      | clientName  | clientEmail          |
      | "Tonystark" | "tonystark@gmail.com" |
