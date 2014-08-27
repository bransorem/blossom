Feature: Demo
    Test German demo form
    at /de/demo/das-ist-neu-sugar

    Scenario: Test German global form
        Given I visit "/de/demo/das-ist-neu-sugar"
          And the parameter "utm_source" is "google"
          And the parameter "utm_medium" is "sitelink"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "130"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "VP of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level2"
          And I select field "#Industry" as "Real Estate"
          And I click submit
         Then I'm taken to "/de/demo/das-ist-neu-sugar-thanks"