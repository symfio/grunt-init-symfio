symfio = require "symfio"

module.exports = container = symfio "{%= name %}", __dirname

loader = container.get "loader"

loader.use require "symfio-contrib-express"
loader.use require "symfio-contrib-express-logger"
loader.use require "symfio-contrib-mongoose"
loader.use require "./plugins/{%= name %}"
loader.use require "symfio-contrib-fixtures"

loader.load() if require.main is module
