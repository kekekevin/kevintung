describe "ParSheetItem Model", ->

  it "has default values", ->
    parSheetItem = new KevinTung.ParSheetItem()

    expect(parSheetItem.get("par_count")).toBe("1")
