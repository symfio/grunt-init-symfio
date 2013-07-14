module.exports = (grunt) ->
  grunt.initConfig
    simplemocha:
      backend_acceptance: "test/backend_acceptance/**/*.coffee"
      plugins: "test/plugins/**/*.coffee"
      options: reporter: process.env.REPORTER or "spec"
    karma:
      frontend_acceptance: configFile: "test/frontend_acceptance.coffee"
      modules: configFile: "test/modules.coffee"
    coffeelint:
      index: "index.coffee"
      plugins: "plugins/**/*.coffee"
      test: "test/**/*.coffee"
      grunt: "Gruntfile.coffee"

  grunt.loadNpmTasks "grunt-simple-mocha"
  grunt.loadNpmTasks "grunt-karma"
  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask "default", [
    "simplemocha"
    "e2e"
    "karma:modules"
    "coffeelint"
  ]

  grunt.registerTask "server", ->
    callback = @async()

    container = require "./index"

    container.promise.then ->
      container.get "startExpressServer"

    .then (startExpressServer) ->
      startExpressServer()

    .then ->
      container.get "logger"

    .then (logger) ->
      logger.clear()
      callback()

  grunt.registerTask "e2e", ->
    grunt.task.run "server"
    grunt.task.run "karma:frontend_acceptance"
