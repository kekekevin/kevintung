describe "ParSheet Model", ->

  parSheet = new KevinTung.ParSheet()
  
  it "has default values", ->
    expect(parSheet.get("name")).toBe("")

  it "has the correct urlRoot", ->
    expect(parSheet.urlRoot).toBe("/par_sheets")
