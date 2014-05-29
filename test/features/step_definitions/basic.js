var assert = require('assert');
var fs = require('fs');

module.exports = function () {
    var mktoForm = "form#mktoForm_";  // this is the mandated naming convention
    this.World = require('../support/world.js').World;

    // path to visit is set (but we still need to add the parameters to check)
    this.Given('I visit "$path"', function (path, callback) {
        this.fullPath = this.baseUrl + path;
        callback();
    });

    // add a parameter to check
    this.Given('the parameter "$param" is "$val"', function (param, val, callback) {
        this.params = this.params || [];
        this.params.push({ p: param, v: val });
        callback();
    });

    // compile all parameters and the path to visit, then visit it
    this.Given('the page loads', function (callback) {
        var browser = this.browser;
        
        // set the path parameters
        var full = this.fullPath;
        if (this.params.length > 0){
            var para = this.params[0];
            full = full + '?' + para.p + '=' + para.v;
            for (var i = 1; i < this.params.length; i++){
                para = this.params[i];
                full = full + '&' + para.p + '=' + para.v;
            }
        }

        this.fullPath = full;

        browser
            .init(this.desired)
            .get(full)
            .nodeify(callback);
    });

    // form fill
    this.Then('I fill out form "$id"', function (id, callback) {
        var form = mktoForm + id;
        var d = (new Date).getTime();   // timestamp for test
        var browser = this.browser;

        browser
            .waitForElementByCss(form + " #Email", 5000)    // wait for the form to load
            .elementByCss(form + ' #Email').type('test_' + d + '@sugarcrm.com')
            .elementByCss(form + ' #FirstName').type('Test')
            .elementByCss(form + ' #LastName').type('Test_' + d)
            .elementByCss(form + ' #Company').type('SugarCRM')
            .elementByCss(form + ' #NumberOfEmployees').click()
            .elementByCss(form + ' #NumberOfEmployees option[value="level1"]').click()
            .elementByCss(form + ' #Phone').type('555-555-5555')
            .elementByCss(form + ' #Country').type('USA')
            .elementByCss(form + ' .mktoButton').click()
            .nodeify(callback);
    });

    // end on thank you page
    this.Then('I\'m taken to "$path"', function (path, callback) {
        var browser = this.browser;
        browser
            .elementByCss('h1')
            .text().should.become('Thanks for filling out the form!')
            .quit()
            .sauceJobStatus(true)
            .nodeify(callback);
    });
};
