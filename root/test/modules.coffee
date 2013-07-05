basePath = ".."

browsers = [
  "PhantomJS"
]

files = [
  JASMINE
  JASMINE_ADAPTER

  "public/bower_components/angular/angular.js"
  "public/bower_components/angular-resource/angular-resource.js"
  "public/bower_components/angular-mocks/angular-mocks.js"

  "public/scripts/{%= dev_file %}.coffee"
  "public/scripts/{%= name %}.coffee"

  "test/modules/**/*.coffee"
]

logLevel = LOG_WARN

port = 9878

reporters = [
  "dots"
]

runnerPort = 9101

singleRun = true

urlRoot = "/__karma/modules/"
