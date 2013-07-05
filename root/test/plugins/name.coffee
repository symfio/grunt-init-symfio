symfio = require "symfio"
sinon = require "sinon"
chai = require "chai"


describe "{%= name %}()", ->
  chai.use require "chai-as-promised"
  chai.use require "sinon-chai"
  chai.should()

  container = null
  sandbox = null

  beforeEach (callback) ->
    container = symfio "test", __dirname
    sandbox = sinon.sandbox.create()

    container.set "model", ->
      sandbox.spy()

    container.set "get", ->
      sandbox.spy()

    container.injectAll([
      require "../../plugins/{%= name %}"
    ]).should.notify callback

  afterEach ->
    sandbox.restore()

  describe "model Thing", ->
    it "should define model", (callback) ->
      container.get("model")
      .should.eventually.calledWith("Thing", "things").and.notify callback

  describe "get /things", ->
    it "should define controller", (callback) ->
      container.get("get")
      .should.eventually.calledWith("/things").and.notify callback
