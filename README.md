blossom
=======

SugarCRM integration tests for Marketo forms using Cucumber.js and Sauce Labs.


## Installation

* Download and install Node.js from [http://nodejs.org/download/](http://nodejs.org/download/)
* Fork source code from [https://github.com/bsorem-sugarcrm/blossom](https://github.com/bsorem-sugarcrm/blossom)
* Get login credentials for Sauce Labs [https://docs.saucelabs.com/tutorials/node-js/](https://docs.saucelabs.com/tutorials/node-js/) - under "Setting up a project"
* Open Terminal
* cd into `blossom` directory
* Run commands from Sauce labs to set credentials `export SAUCE_USERNAME=...`
* `npm install` - this will install the dependencies that `blossom` requires.


## Getting Started

Tests exist in the form of .feature files. *All* of the .feature files that exists in test/features/ will be run automatically from the scripts below.

### Run Tests on one specific browser

To run the test, type one of the following commands:

`grunt test:sauce:chrome` for testing Chrome
`grunt test:sauce:ie` for testing Internet Explorer
`grunt test:sauce:ff` for testing Firefox

### Run Tests on all browsers

You'll need to use Sauce labs credentials

```
export SAUCE_USERNAME=<replace_this_with_username>
export SAUCE_ACCESS_KEY=<replace_this_with_accesskey>
```

To run the test, type the following command:

```
npm test-all
```

### Credential issues

You'll need to use Sauce labs credentials

```
export SAUCE_USERNAME=<replace_this_with_username>
export SAUCE_ACCESS_KEY=<replace_this_with_accesskey>
```


## Writing tests

Tests are written using [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin). Each test exists in a .feature file. I will use land_and_browse.feature as an example:

`Feature: Land and browse`
This line synopsizes the feature (test).

```
    In order to ensure that 
    I can land and browse
    Before filling out a form
    I want to test the flow of
    following a link
    clicking another link
    then filling out a form
```

This block describes, generally, what the test is doing. There is no strict format here, just a text description will suffice.

`    Scenario: Email campaign`

This line synopsizes the scenario of the test.

`        Given I visit "/marketo/form/1"`

This is important - pretty much every test should start with this. You want to visit a webpage to run the test on; this line describes where that page is. It will not load the page at this point.

```
          And the parameter "utm_source" is "test"
          And the parameter "utm_medium" is "email"
          And the parameter "utm_campaign" is "test_campaign"
```

These commands set parameters in the URL. You can set any number of arbitrary parameters. `And the parameter PARAM_NAME is PARAM_VAL` will turn into &PARAM_NAME=PARAM_VAL in the URL.

`          And the page loads`

This is also important - it will actually load the page in the browser. This is the starting point of the test.

`         Then I click ".site_logo"`

You can click any element on the page using CSS selector syntax. The effect of this example will take the user to the home page.

`         Then I visit "/marketo/form/2"`

Again, we set a new path to visit.

`          And the page loads`

And actually load the page.

`         When I fill out form "8"`

This is how you fill out a specific form. The "8" in this example targets the Marketo form with ID=8.

`          And I fill field "#FirstName" as "Test"`

This is generally how you fill out a text field. The field is targeted by a CSS selector and filled in with the `as` value - in this case "Test".

`          And I fill field "#LastName" as "Test_" with timestamp`

This specific syntax (` with timestamp`) will add a UNIX-formatted timestamp to the end of the text. e.g. "Test_" will become something like "Test_1403719957"

`          And I fill field "#Email" as "test@sugarcrm.com" with timestamp`

Whenever you use the ` with timestamp` syntax on a field that contains "email" (case insensitive), then the UNIX-formatted timestamp will be included just before the "@" symbol with a "_" prefix. e.g. "test@sugarcrm.com" will become something like "test_1403719957@sugarcrm.com"

```
          And I fill field "#Company" as "SugarCRM"
          And I fill field "#Phone" as "555-555-5555"
          And I fill field "#Title" as "Job Title Goes Here"
```

More text fields.

```
          And I select field "#NumberOfEmployees" as "level1"
          And I select field "#Industry" as "Engineering"
```

This is two examples of how you select an option from a dropdown list.

`          And I fill field "#Country" as "USA"`

Another text field.

`          And I click submit`

This is how you actually submit the form.

`         Then I'm taken to "/marketo/thanks"`

This is how you verify that you are redirected correctly after the form submits successfully. A failing here may indicate that the form did not submit correctly.



## License
Copyright (c) 2014 SugarCRM  
Licensed under the MIT license.