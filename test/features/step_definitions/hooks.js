module.exports = function() {
    this.Before(function(callback){
        this.browser
            .init(this.desired)
            .nodeify(callback);
    });

    this.After(function(callback){
        // TODO: actually check if all passed
        this.browser
            .quit()
            .sauceJobStatus(this.passed)
            .nodeify(callback);
    });
};