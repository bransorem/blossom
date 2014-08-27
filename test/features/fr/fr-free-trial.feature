Feature: Free trial
    Test French free trial form
    at /fr/webform/essayez-sugarcrm-gratuitement-pendant-7-jours

    Scenario: Test French free trial form
        Given I visit "/fr/webform/essayez-sugarcrm-gratuitement-pendant-7-jours"
          And the parameter "utm_source" is "sugar"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "97"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "Director of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level5"
          And I select field "#Industry" as "Not for profit"
          And I click submit
         Then I'm taken to "/fr/trial/thank-you-FR"