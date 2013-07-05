chai = require "chai"
w = require "when"


describe "{%= name %}", ->
  chai.use require "chai-as-promised"
  chai.use require "chai-http"
  chai.should()

  container = require "../.."
  container.set "env", "test"

  before (callback) ->
    @timeout 0
    container.promise.should.notify callback

  describe "GET /things", ->
    it "should respond with things", (callback) ->
      container.get("app").then (app) ->
        deferred = w.defer()
        chai.request(app).get("/things").res deferred.resolve
        deferred.promise
      .then (res) ->
        res.should.have.status 200
        res.body.should.have.length 1
        res.body[0].should.have.property "thing"
        res.body[0].thing.should.equal "Hooray!"
      .should.notify callback
