Feature: Land and browse
    In order to ensure that 
    I can land and browse
    Before filling out a form
    I want to test the flow of
    following a link
    clicking another link
    then filling out a form

    Scenario: Email campaign
        Given I visit "/marketo/form/1"
          And the parameter "utm_source" is "test"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "test_campaign"
          And the page loads
         Then I click ".site_logo"
         Then I visit "/marketo/form/2"
          And the page loads
         When I fill out form "8"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I fill field "#Title" as "Job Title Goes Here"
          And I select field "#NumberOfEmployees" as "level1"
          And I select field "#Industry" as "Engineering"
          And I click submit
         Then I'm taken to "/marketo/thanks"