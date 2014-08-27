Feature: Global
    Test English ce form
    at /download-sugarcrm-community-edition-free-b

    Scenario: Test English ce form
        Given I visit "/download-sugarcrm-community-edition-free-b"
          And the parameter "utm_source" is "bing"
          And the parameter "utm_medium" is "banner"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "111"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#interest" as "Looking to OEM or embed Sugar"
          And I click submit
         Then I'm taken to "/thanks-your-interest-sugar-community-edition"