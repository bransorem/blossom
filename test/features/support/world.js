var util = require('util');
var wd = require('wd');
require('colors');
var _ = require("lodash");
var chai = require("chai");
var chaiAsPromised = require("chai-as-promised");

var World = function World(callback) {
    // this.baseUrl = 'http://www.sugarcrm.com';
    chai.use(chaiAsPromised);
    chai.should();
    chaiAsPromised.transferPromiseness = wd.transferPromiseness;

    // checking sauce credential
    if(!process.env.SAUCE_USERNAME || !process.env.SAUCE_ACCESS_KEY){
        console.warn(
            '\nPlease configure your sauce credential:\n\n' +
            'export SAUCE_USERNAME=<SAUCE_USERNAME>\n' +
            'export SAUCE_ACCESS_KEY=<SAUCE_ACCESS_KEY>\n\n'
        );
        throw new Error("Missing sauce credentials");
    }

    // http configuration, not needed for simple runs
    wd.configureHttp( {
        timeout: 60000,
        retryDelay: 15000,
        retries: 5
    });

    var desired = JSON.parse(process.env.DESIRED || '{browserName: "chrome"}');
    desired.name = 'example with ' + desired.browserName;
    desired.tags = ['marketo', 'form'];

    this.chai = chai;
    this.wd = wd;
    this.desired = desired;
    this.baseUrl = "http://www.sugarcrm.com";

    var domain = "ondemand.saucelabs.com";
    var username = process.env.SAUCE_USERNAME;
    var accessKey = process.env.SAUCE_ACCESS_KEY;
    var browser = this.browser = wd.promiseChainRemote(domain, 80, username, accessKey);

    if(process.env.VERBOSE){
        // optional logging     
        browser.on('status', function(info) {
            console.log(info.cyan);
        });
        browser.on('command', function(meth, path, data) {
            console.log(' > ' + meth.yellow, path.grey, data || '');
        });            
    }

    // browser.init(desired);

    var world = this;
    callback(world);
};

module.exports.World = World;
