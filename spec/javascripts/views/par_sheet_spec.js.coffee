describe "Par Sheet View", ->

  beforeEach ->
    loadFixtures "par_sheet_view"
    spyOn($, "ajax")

    @fooItem = new KevinTung.ParItem(
      id: 1
      name: "foo"
    )
    @barItem = new KevinTung.ParItem(
      id: 2
      name: "bar"
    )
    @parSheetItem = new KevinTung.ParSheetItem(
      id: 1
      par_count: 2
      par_item_id: 1
    )
    @parSheetItem2 = new KevinTung.ParSheetItem(
      id: 2
      par_count: 3
      par_item_id: 2
    )
    @parItems = new KevinTung.ParItems()
    @parItems.add(@fooItem)
    @parItems.add(@barItem)
    @parSheetItems = new KevinTung.ParSheetItems()
    @parSheetItems.add(@parSheetItem)
    @parSheetItems.add(@parSheetItem2)
    @parSheet = new KevinTung.ParSheet(
      id: 1
    )
    @parSheetView = new KevinTung.ParSheetView(
      model: @parSheet
    )
    @parSheetView.inventory = @parSheetItems
    @parSheetView.item_collection = @parItems
  
  it "should be tied to a DOM element", ->
    expect(@parSheetView.render().el).toHaveClass("par_sheet")

  it "should populate the correct url for par sheet items", ->
    parSheetView = new KevinTung.ParSheetView(
      model: @parSheet
    )
    expect(parSheetView.inventory.url).toBe("/par_sheets/1/par_sheet_items")

  describe "render", ->

    beforeEach ->
      @parSheetView.render()

    it "should display the correct amount of sheet items", ->
      expect($(".sheet_item", @parSheetView.el)).toHaveLength(2)

    it "should display the correct amount of items", ->
      $(".sheet_item").each (index, el) ->
        expect($("option", el)).toHaveLength(2)

    it "should select the correct par item for each sheet item", ->
      expect($($(".sheet_item #par_item_id")[0]).val()).toBe("1")
      expect($($(".sheet_item #par_item_id")[1]).val()).toBe("2")

  describe "createItem", ->
    
    beforeEach ->
      @parSheetView.createItem()
      @parSheetView.render()

    it "should add a new item to the item collection", ->
      expect(@parSheetView.item_collection.length).toBe(3)

    it "should render an additional select option", ->
      $(".sheet_item").each (index, el) ->
        expect($("option", el)).toHaveLength(3)

  describe "addItem", ->
    
    beforeEach ->
      @parSheetView.addItem()
      @parSheetView.render()

    it "should add a new sheet item", ->
      expect($(".sheet_item")).toHaveLength(3)

    it "should add a new sheet item to the inventory", ->
      expect(@parSheetView.inventory.length).toBe(3)

  describe "saveitem", ->

    beforeEach ->
      @parSheetView.render()
      $("#name", @parSheetView.el).val("foobar")
      @parSheetView.saveSheet()

    it "should save the latest version of the sheet", ->
      expect(@parSheetView.model.get("name")).toBe("foobar")
      expect($.ajax).toHaveBeenCalled()
