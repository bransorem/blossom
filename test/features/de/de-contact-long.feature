Feature: Contact Long
    Test German Contact Long form
    at /marketo/form/german-contact

    Scenario: Test German contact long form
        Given I visit "/marketo/form/german-contact"
          And the parameter "utm_source" is "partner_abc"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "DE_TEST_789"
          And the page loads
         When I fill out form "135"
          And I fill field "#FirstName" as "Test"
          And I fill field "#LastName" as "Test_" with timestamp
          And I fill field "#Email" as "test@sugarcrm.com" with timestamp
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I select field "#num_of_employees" as "level3"
          And I select field "#Industry" as "Engineering"
          And I fill field "#comments" as "Some comments"
          And I click submit
         Then I'm taken to "/marketo/thanks"