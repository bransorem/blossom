Feature: UTM parameters
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
         When I fill out form "8"
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Company" as "SugarCRM"
          And I select field "#NumberOfEmployees" as "level1"
          And I fill field "#Phone" as "555-555-5555"
          And I fill field "#Country" as "USA"
          And I click submit
         Then I'm taken to "/marketo/thanks"