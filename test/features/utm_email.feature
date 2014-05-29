Feature: UTM parameters from email
    In order to ensure that 
    UTM parameters work
    I want to test the flow of
    following a link
    then filling out a form

    Scenario: Test UTM from Email
        Given I visit "/marketo/form/1"
          And the parameter "utm_source" is "test"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "test_campaign"
          And the page loads
         Then I fill out form "24"
         Then I'm taken to "/marketo/thanks"