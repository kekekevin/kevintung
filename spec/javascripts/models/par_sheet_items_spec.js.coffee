describe "ParSheetItems Collection", ->

  beforeEach ->
    @parSheetItems = new KevinTung.ParSheetItems()

  it "can add par sheet items", ->
    parSheetItem = new KevinTung.ParSheetItem()

    @parSheetItems.add(parSheetItem)

    expect(@parSheetItems.length).toBe(1)

  it "has the correct url", ->
    expect(@parSheetItems.url).toBe("/par_sheet_items")
