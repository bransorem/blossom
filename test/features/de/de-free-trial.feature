Feature: Free trial
    Test German free trial form
    at /marketo/form/german-free-trial

    Scenario: Test German free trial form
        Given I visit "/marketo/form/german-free-trial"
          And the parameter "utm_source" is "linkedin"
          And the parameter "utm_medium" is "sitelink"
          And the parameter "utm_campaign" is "DE_TEST_789"
          And the page loads
         When I fill out form "92"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "VP of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level3"
          And I select field "#Industry" as "Engineering"
          And I click submit
         Then I'm taken to "/marketo/thanks"