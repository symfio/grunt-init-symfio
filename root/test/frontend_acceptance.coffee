basePath = ".."

browsers = [
  "PhantomJS"
]

files = [
  JASMINE
  JASMINE_ADAPTER
  ANGULAR_SCENARIO
  ANGULAR_SCENARIO_ADAPTER

  "test/frontend_acceptance/**/*.coffee"
]

logLevel = LOG_WARN

proxies = "/": "http://localhost:3000/"

reporters = [
  "dots"
]

singleRun = true

urlRoot = "/__karma/frontend_acceptance/"
