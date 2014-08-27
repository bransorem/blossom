Feature: Global
    Test French demo form
    at /fr/demo/quoi-de-neuf-dans-sugar

    Scenario: Test French demo form
        Given I visit "/fr/webform/essayez-sugarcrm-gratuitement-pendant-7-jours"
          And the parameter "utm_source" is "linkedin"
          And the parameter "utm_medium" is "sitelink"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "129"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "Manager of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level4"
          And I select field "#Industry" as "Media"
          And I click submit
         Then I'm taken to "/fr/demo/quoi-de-neuf-dans-sugar-thanks"