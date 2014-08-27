Feature: Contact Long
    Test French Contact Long form
    at /fr/about/contact-us

    Scenario: Test French contact long form
        Given I visit "/fr/about/contact-us"
          And the parameter "utm_source" is "google"
          And the parameter "utm_medium" is "textad"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "136"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level3"
          And I select field "#Industry" as "Marketing/PR"
          And I fill field "#comments" as "Some comments"
          And I click submit
         Then I'm taken to "/fr/contact-us-thanks"