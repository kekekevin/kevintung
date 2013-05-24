describe "ParItem Model", ->

  it "has default values", ->
    parItem = new KevinTung.ParItem()

    expect(parItem.get("name")).toBe("")
    expect(parItem.get("description")).toBe("")
