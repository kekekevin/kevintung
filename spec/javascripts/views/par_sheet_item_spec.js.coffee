describe "ParSheetItem View", ->

  beforeEach ->
    loadFixtures "par_sheet_item_view"
    @parSheetItem = new KevinTung.ParSheetItem(
      id: 1
      par_count: 2
      par_item_id: 3
    )
    @parSheetItem.url = "/foo"

    @parSheetItemView = new KevinTung.ParSheetItemView(
      model: @parSheetItem
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

  describe "removeItem", ->

    beforeEach ->
      spyOn($, "ajax")
      $('.sheet').append(@parSheetItemView.render().el)

      @parSheetItemView.removeItem()

    it "should sync with the server", ->
      expect($.ajax).toHaveBeenCalled()

    it "should remove the html", ->
      expect($('.sheet')).toBeEmpty()

  describe "saveItem", ->
    
    beforeEach ->
      spyOn($, "ajax")
      @parSheetItemView.render()
      $("#par_count", @parSheetItemView.el).val("3")
      $("#par_item_id", @parSheetItemView.el).append("<option value=3 selected=selected></option>")

      @parSheetItemView.saveItem()

    it "should sync to the server", ->
      expect($.ajax).toHaveBeenCalled()

    it "should update the model with new attributes", ->
      expect(@parSheetItemView.model.get("par_count")).toBe("3")
      expect(@parSheetItemView.model.get("par_item_id")).toBe("3")
