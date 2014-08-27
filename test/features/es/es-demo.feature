Feature: Global
    Test Spanish demo form
    at /la/demo/vea-las-novedades-en-sugarcrm

    Scenario: Test Spanish demo form
        Given I visit "/la/demo/vea-las-novedades-en-sugarcrm"
          And the parameter "utm_source" is "google"
          And the parameter "utm_medium" is "textad"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "194"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "CEO of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level6"
          And I select field "#Industry" as "Healthcare"
          And I click submit
         Then I'm taken to "/la/demo/vea-las-novedades-en-sugarcrm-thanks"