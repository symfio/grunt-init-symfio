symfio = require "symfio"


module.exports = container = symfio "{%= name %}", __dirname

container.set "components", [
  "angular#~1.0"
  "angular-resource#~1.0"
  "angular-mocks#~1.0"
]

module.exports.promise = container.injectAll [
  require "symfio-contrib-winston"
  require "symfio-contrib-express"
  require "symfio-contrib-assets"
  require "symfio-contrib-bower"
  require "symfio-contrib-mongoose"
  require "symfio-contrib-fixtures"

  require "./plugins/{%= name %}"
]


if require.main is module
  module.exports.promise.then ->
    container.get "listener"
  .then (listener) ->
    listener.listen()
