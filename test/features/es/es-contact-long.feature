Feature: Contact Long
    Test Spanish Contact Long form
    at /la/about/contact-us

    Scenario: Test Spanish contact long form
        Given I visit "/la/about/contact-us"
          And the parameter "utm_source" is "bing"
          And the parameter "utm_medium" is "banner"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "143"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level5"
          And I select field "#Industry" as "Government"
          And I fill field "#comments" as "Some comments"
          And I click submit
         Then I'm taken to "/la/contact-us-thanks"