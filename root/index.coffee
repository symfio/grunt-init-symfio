symfio = require "symfio"
w = require "when"


load = (modules) ->
  ->
    modules = [modules] unless Array.isArray modules
    container.injectAll modules.map require

run = (runners) ->
  ->
    runners = [runners] unless Array.isArray runners
    container.get(runners).then (runners) ->
      w.map runners, (runner) ->
        runner()


module.exports = container = symfio "{%= name %}", __dirname

container.set "components", [
  "angular#~1.0"
  "angular-resource#~1.0"
  "angular-mocks#~1.0"
]

module.exports.promise = (do load "symfio-contrib-nconf")
.then(run "loadConfig")
.then(load [
  "symfio-contrib-winston"
  "symfio-contrib-express"
  "symfio-contrib-assets"
  "symfio-contrib-bower"
  "symfio-contrib-mongoose"
  "symfio-contrib-fixtures"
  "./plugins/{%= name %}"
])
.then(run [
  "loadFixtures"
  "installBowerComponents"
  "servePublicDirectory"
])

if require.main is module
  module.exports.promise.then run "startExpressServer"
