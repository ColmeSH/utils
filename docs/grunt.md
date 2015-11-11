# Grunt Utils

Here you can find a basic template for the creation of a new Gruntfile

##Install Grunt

You will need the Grunt command line (you can install it with the node package manager):

    - 'npm install -g grunt-cli'

## Install Tasks

From anyway on your command line:

    "devDependencies": {
        "grunt-concurrent": "~0.5.0",
        "grunt-contrib-watch": "~0.6.1",
        "grunt-nodemon": "~0.3.0",
        "grunt-wiredep": "~2.0.0",
        "grunt-concat-css": "~0.3.1",
        "grunt-contrib-cssmin": "^0.10.0",
        "load-grunt-tasks": "^3.2.0",
        "grunt-contrib-concat": "^0.5.1",
        "grunt-contrib-jshint": "~0.9.2",
        "grunt-contrib-uglify": "~0.4.0"
    }

## Gruntfile

This example is based on a MEAN Stack application:

    // GRUNT INIT
    module.exports = function(grunt){

    // AUTO LOAD GRUNT TASK
    require('load-grunt-tasks')(grunt);

    // GRUNT CONFIGURATION
    grunt.initConfig({

        // GRUNT AUTO LOAD TASK CONFIG
        pkg: grunt.file.readJSON('package.json'),

        // NODEMON TASK CONFIG
        nodemon: {
            dev: {
                script: 'server.js' // SPECIFIC NODEMON SCRIPT FOR RUNNING YOUR APP
            }
        },

        // JS TASKS CONFIG

        // JS SINTAX CHECK
        jshint: {
            all: 'public/**/*.js' // CHECK ALL THE JS FILE IN SPECIFIC SOURCE PATH
        },

        // JS CONCATENATION (USEFUL FOR ANGULAR)
        concat: {
            options: {
                separator: ''
            },
            angular: {
                src:  ['public/*.js', 'public/*/*.js', 'public/*/*/*.js'], // SOURCE PATH
                dest: 'assets/js/src/angular/angular-main.js' // DESTINATION PATH
            }
        },

        // JS MINIFICATION
        uglify: {
            build: {
                files: {
                    'assets/js/dist/main.min.js': 'assets/js/src/**/*.js' // DESTINATION PATH : SOURCE PATH
                }
            }
        },

        // BOWER TASKS CONFIG

        // BOWER AUTO IMPORT
        wiredep: {
            task: {
                src: ['app/views/master.ejs','app/views/scripts.ejs'], // DESTINATION PATH/S
            },
            options: {
                ignorePath: '../../assets', // LIB PATH ADJUSTMENT
            }
        },

        // CSS TASKS CONFIG

        // CSS CONCATENATION
        concat_css: {
            all: {
                src: 'assets/css/src/**/*.css', // SOURCE PATH
                dest: 'assets/css/dist/style.css' // DESTINATION PATH
            }
        },

        // CSS MINIFICATION
        cssmin: {
            build: {
                files: {
                    'assets/css/dist/style.min.css': 'assets/css/dist/style.css' // DESTINATION PATH : SOURCE PATH
                }
            }
        },

        // WATCH TASK CONFIG (USEFUL FOR REALTIME CHANGES - RUN TASKS ON FILE CHANGES)
        watch: {
            bower: {
                files: ['assets/lib/*'], // PATH TO WATCH
                tasks: ['wiredep'] // TASK TO RUN ON CHANGES
            },
            css: {
                files: ['assets/css/src/**/*.css'],
                tasks: ['concat_css', 'cssmin']
            },
            angular: {
                files: 'public/**/*.js',
                tasks: ['concat', 'uglify']
            },
        },

        // CONCURRENT TASK CONFIG (USEFUL TO RUN CONCURRENT TASKS)
        concurrent: {
            options: {
                logConcurrentOutput: true
            },
            tasks: ['nodemon', 'watch']
        }
    })

    // DEFAULT RUN TASK DECLARATION (DEFAULT IS RUNNING SIMPLY BY LAUNCHING GRUNT)
    grunt.registerTask('default', ['wiredep', 'concat_css', 'cssmin', 'concat', 'uglify', 'concurrent']);
    }
