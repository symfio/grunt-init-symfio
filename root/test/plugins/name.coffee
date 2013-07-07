suite = require "symfio-suite"


describe "{%= name %}()", ->
  it = suite.plugin (container) ->
    container.set "model", (sandbox) ->
      sandbox.spy()

    container.set "get", (sandbox) ->
      sandbox.spy()

    container.inject (model, get) ->
      require("../../plugins/{%= name %}") model, get

  describe "model Thing", ->
    it "should define model", (model) ->
      model.should.calledWith "Thing", "things"

  describe "get /things", ->
    it "should define controller", (get) ->
      get.should.calledWith "/things"
