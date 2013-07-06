suite = require "symfio-suite"


describe "{%= name %} example", ->
  it = suite.example require "../.."

  describe "GET /things", ->
    it "should respond with things", (request) ->
      request.get("/things").then (res) ->
        res.should.have.status 200
        res.body.should.have.length 1
        res.body[0].should.have.property "thing"
        res.body[0].thing.should.equal "Hooray!"
