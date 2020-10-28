Feature: Login

  Scenario Outline: Login Successfully
    Given set scenario variables from data/UserInfo.json
    Given set scenario variables from data/TabithaJobBoard.json
    Given set header Content-Type to <Content-Type>
    Given set header Authorization to <Token>
    When logged in tabitha account visit Mobile App with <endpoint 1> and <login 1>.
# Then response body should be valid according to schema file test/example/generated/responseSchema.json
    Then response body path refresh_token_status should be equal to scenario variable refresh_token_status
    Then put the value of body path access_token as access_token in scenario scope
    Then put the value of body path refresh_token as refresh_token in scenario scope
    Given set access token from access_token to Authorization header
    When Try to get user job account information from <endpoint 2>.
#    Then response body path userTier should be equal to scenario variable userTier
    Then response body path customerRole should be equal to scenario variable customerRole
    Examples:
      | endpoint 2                           | login 1         | endpoint 1                 | Content-Type                      | Token                                                                      |
      | get:/v1.1/ecomm/currentUser/jobBoard | data/login.json | post:/v1.1/ecomm-idp/token | application/x-www-form-urlencoded | Basic R29CUklJY0hHY3NTNGwwOGl6QnBEUkhVdUx3NWd0OFg6WEMweUVyWlhEYThkb3Vadw== |

  Scenario Outline: Login Failed with Wrong Password
    Given set scenario variables from <error 1>
    And set header Content-Type to <Content-Type>
    And set header Authorization to <Token>
    When logged in tabitha account with wrong token to visit Mobile App with <endpoint 1> and <login 1>.
    Then Validate response body
    And response body path message[0].status should be equal to scenario variable status
    And response body path message[0].status should be equal to scenario variable status
    And response body path message[0].status should be equal to scenario variable status
    Examples:
      | error 1                           | login 1                                                  | endpoint 1                 | Content-Type                      | Token                                                                      |
      | data/error.ts[WrongPasswordError] | data/login.request.ts[LoginRequestsTabithaWrongPassword] | post:/v1.1/ecomm-idp/token | application/x-www-form-urlencoded | Basic R29CUklJY0hHY3NTNGwwOGl6QnBEUkhVdUx3NWd0OFg6WEMweUVyWlhEYThkb3Vadw== |

  Scenario Outline: Login Failed with Wrong Token
    Given set scenario variables from <error 1>
    Given set header Content-Type to <Content-Type>
    Given set header Authorization to <Token>
    When logged in tabitha account with wrong token to visit Mobile App with <endpoint 1> and <login 1>.
    Then response body path message[0] should be equal to scenario variable message
    Examples:
      | error 1                        | login 1                                                  | endpoint 1                 | Content-Type                      | Token                    |
      | data/error.ts[WrongTokenError] | data/login.request.ts[LoginRequestsTabithaWrongPassword] | post:/v1.1/ecomm-idp/token | application/x-www-form-urlencoded | Basic R29CUklJY0hHY3NTNG |
