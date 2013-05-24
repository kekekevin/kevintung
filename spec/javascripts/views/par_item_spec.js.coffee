describe "Par Item View", ->

  beforeEach ->
    loadFixtures "par_item_fixture"
    @parItemView = new KevinTung.ParItemView(
      model: new KevinTung.ParItem(
        id: 1
        name: "foo"
      )
    )

  it "should be tied to a DOM element", ->
    expect(@parItemView.el).toBe("option")

  describe "render", ->

    it "should return the view object", ->
      expect(@parItemView.render()).toEqual(@parItemView)

    it "should have the correct html", ->
      @parItemView.render()

      expect(@parItemView.$el.val()).toBe("1")
      expect(@parItemView.$el.text()).toBe("foo")
