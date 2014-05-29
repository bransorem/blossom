'use strict';

var _ = require('lodash');

// Get browsers to test
var desireds = require('./desireds');

var gruntConfig = {
        env: {
            // dynamically filled
        },
        cucumberjs: {
            src: 'test/features',
            options: {
                steps: 'test/features/step_definitions'
            }
        },    
        jshint: {
            options: {
                jshintrc: '.jshintrc'
            },
            gruntfile: {
                src: 'Gruntfile.js'
            },
            test: {
                options: {
                    jshintrc: 'test/.jshintrc'
                },                
                src: ['test/**/*.js']
            },
        },
        concurrent: {
            'test-sauce': [], // dynamically filled
        },
        watch: {
            gruntfile: {
                files: '<%= jshint.gruntfile.src %>',
                tasks: ['jshint:gruntfile']
            },
            test: {
                files: '<%= jshint.test.src %>',
                tasks: ['jshint:test']
            },
        },
    };
 
_(desireds).each(function(desired, key) {
    gruntConfig.env[key] = { 
        DESIRED: JSON.stringify(desired)
    };
    gruntConfig.concurrent['test-sauce'].push('test:sauce:' + key);
});

//console.log(gruntConfig);

module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig(gruntConfig);

    // These plugins provide necessary tasks.
    grunt.loadNpmTasks('grunt-env');
    grunt.loadNpmTasks('grunt-cucumber');
    grunt.loadNpmTasks('grunt-concurrent');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-watch');

    // Default task.
    grunt.registerTask('default', ['test:sauce:' + _(desireds).keys().first()]);

    _(desireds).each(function(desired, key) {
            grunt.registerTask('test:sauce:' + key, ['env:' + key, 'cucumberjs']);
    });

    grunt.registerTask('test:sauce:parallel', ['concurrent:test-sauce']);
};
