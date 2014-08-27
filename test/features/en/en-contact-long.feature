Feature: Contact Long
    Test English Contact Long form
    at /contact

    Scenario: Test English contact long form
        Given I visit "/contact"
          And the parameter "utm_source" is "partner_abc"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "134"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level1"
          And I select field "#Industry" as "Automotive"
          And I fill field "#comments" as "Some comments"
          And I click submit
         Then I'm taken to "/contact-us-thanks"