describe "{%= name %}", ->
  describe "/", ->
    beforeEach ->
      browser().navigateTo "/"

    it "should have uppercased title", ->
      expect(element("h1").text()).toBe "{%= uppercased_name %}"

    it "should have things", ->
      expect(repeater("ul li").count()).toBe 2
      expect(element("ul li:eq(0)").text()).toBe "Alpha"
      expect(element("ul li:eq(1)").text()).toBe "Beta"
