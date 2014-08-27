Feature: Free trial
    Test English free trial form
    at /webform/try-sugarcrm-free-0

    Scenario: Test English free trial form
        Given I visit "/webform/try-sugarcrm-free-0"
          And the parameter "utm_source" is "google"
          And the parameter "utm_medium" is "textad"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the parameter "gclid" is "CMb509yfoMACFQusaQodSwwAgg"
          And the page loads
         When I fill out form "30"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "VP of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level3"
          And I select field "#Industry" as "Consulting"
          And I click submit
         Then I'm taken to "/free_trial_ppc/thankyou"