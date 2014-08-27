Feature: Global
    Test German global form
    at /de/redglaze

    Scenario: Test German global form
        Given I visit "/de/redglaze"
          And the parameter "utm_source" is "google"
          And the parameter "utm_medium" is "textad"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "91"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "Contractor of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level4"
          And I select field "#Industry" as "Other"
          And I click submit
         Then I'm taken to "/de/redglaze-group-danke"