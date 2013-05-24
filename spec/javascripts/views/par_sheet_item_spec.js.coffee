describe "ParSheetItem View", ->

  beforeEach ->
    @parSheetItemView = new KevinTung.ParSheetItemView(
      model: new KevinTung.ParSheetItem(
        id: 1
        par_count: 2
        par_item_id: 3
      )
    )

  it "should bind to a DOM element", ->
    expect(@parSheetItemView.el).toHaveClass("sheet_item")

  describe "render", ->

    it "should return the view", ->
      expect(@parSheetItemView.render()).toEqual(@parSheetItemView)

    it "should render the correct html", ->
      @parSheetItemView.render()

      expect(@parSheetItemView.$el).toContain("input#id[value=1]:hidden")
      expect(@parSheetItemView.$el).toContain("select#par_item_id")
      expect(@parSheetItemView.$el).toContain("input#par_count[type=text][value=2]")
