describe "{%= name %}", ->
  beforeEach module "{%= name %}"

  describe "TitleCtrl", ->
    scope = null

    beforeEach inject ($rootScope, $controller, $injector) ->
      $httpBackend = $injector.get "$httpBackend"
      $httpBackend.when("GET", "/things").respond [
        thing: "Hooray!"
      ]

      scope = $rootScope.$new()

      $httpBackend.expectGET "/things"
      $controller "TitleCtrl", "$scope": scope
      $httpBackend.flush()

    it "should set title", ->
      expect(scope.title).toBe "{%= name %}"

    it "should fetch things", ->
      expect(scope.things[0].thing).toBe "Hooray!"
