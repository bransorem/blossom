Feature: Modal
    In order to ensure that 
    forms work in modals
    I want to test the flow of
    following a link
    then filling out a form
    in a modal

    Scenario: Test Modal form
        Given I visit "/marketo/form/2"
          And the parameter "utm_source" is "test"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "test_campaign"
          And the page loads
         Then I click "#mooo"
         When I fill out form "30"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "Job Title Goes Here"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#NumberOfEmployees" as "level1"
          And I select field "#Industry" as "Engineering"
          And I fill field "#Country" as "USA"
          And I select field "#deployment_region" as "us"
          And I click submit
         Then I'm taken to "/marketo/thanks"