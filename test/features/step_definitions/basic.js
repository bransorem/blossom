var assert = require('assert');
var fs = require('fs');

module.exports = function () {
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
        if (this.hasOwnProperty('params')){
            if (this.params.length > 0){
                var para = this.params[0];
                full = full + '?' + para.p + '=' + para.v;
                for (var i = 1; i < this.params.length; i++){
                    para = this.params[i];
                    full = full + '&' + para.p + '=' + para.v;
                }
            }
        }

        browser
            .get(full)
            .nodeify(callback);
    });

    this.Given('I go to "$path"', function(path, callback){
        this.browser
            .get(this.baseUrl + path)
            .nodeify(callback);
    });

    // form fill
    this.When('I fill out form "$id"', function (id, callback) {
        var mktoForm = this.mktoForm;
        var regex = /^\d+/;
        var form;
        if (regex.exec(id)){
            form = this.form = mktoForm + id;
        }
        else {
            form = this.form = id;
        }
        this.timestamp = (new Date).getTime();   // timestamp for test
        var browser = this.browser;

        browser
            .waitForElementByCss(form + " div", 5000)    // wait for the form to load
            .nodeify(callback);
    });

    this.Given('I fill field "$field" as "$value" with timestamp', function(field, value, callback){
        var form = this.form;

        if (field.toLowerCase().indexOf('email') >= 0){
            var email = value.split('@');
            value = email[0] + '+' + this.timestamp + '@' + email[1];
        }
        else {
            value = value + this.timestamp;
        }
        this.browser
            .elementByCss(form + ' ' + field).type(value)
            .nodeify(callback);
    });

    this.Given('I fill field "$field" as "$value"', function(field, value, callback){
        var form = this.form;
        var selector = form + ' ' + field;
        this.browser
            .elementByCss(selector).type(value)
            .nodeify(callback);
    });

    this.Given('I select field "$field" as "$value"', function(field, value, callback){
        var form = this.form;
        var selector = form + ' ' + field;
        this.browser
            .elementByCss(selector).click()
            .elementByCss(selector + ' option[value="' + value + '"]').click()
            .nodeify(callback);
    });

    this.Given('I click "$selector"', function(selector, callback){
        this.browser
            .elementByCss(selector)
            .click()
            .nodeify(callback);
    });

    this.Then('I click submit', function(callback){
        var form = this.form;
        this.browser
            .elementByCss(form + ' [type="submit"]')
            .click()
            .nodeify(callback);
    });

    // end on thank you page
    this.Then('I\'m taken to "$path"', function (path, callback) {
        this.browser
            .setAsyncScriptTimeout(10000);
        this.browser
            .waitForCondition('window.location.href.indexOf(\'' + path + '\') > 0', 10000)
            .nodeify(callback);
    });
};
