Feature: Global
    Test English demo form
    at /demo/whats-new-sugar

    Scenario: Test English demo form
        Given I visit "/demo/whats-new-sugar"
          And the parameter "utm_source" is "sugar"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "128"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "CEO of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level2"
          And I select field "#Industry" as "Construction"
          And I click submit
         Then I'm taken to "/demo/whats-new-demo-thanks"