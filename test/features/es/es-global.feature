Feature: Global
    Test Spanish global form (not yet on production)
    at /marketo/form/spanish-global

    Scenario: Test Spanish global form
        Given I visit "/marketo/form/spanish-global"
          And the parameter "utm_source" is "partner_abc"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "POST_rollout_sunday_funday"
          And the page loads
         When I fill out form "142"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Title" as "CMO of Testing"
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level2"
          And I select field "#Industry" as "Insurance/Finance"
          And I click submit
         Then I'm taken to "/marketo/thanks"