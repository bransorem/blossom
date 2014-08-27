Feature: Free trial
    Test German free trial form
    at /de/webform/testen-sie-sugarcrm-7-tage-kostenfrei

    Scenario: Test German free trial form
        Given I visit "/de/webform/testen-sie-sugarcrm-7-tage-kostenfrei"
          And the parameter "utm_source" is "google"
          And the parameter "utm_medium" is "banner"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "92"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "Associate of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level3"
          And I select field "#Industry" as "Retail and Consumer"
          And I click submit
         Then I'm taken to "/de/free_trial_de/thank-you-DE"