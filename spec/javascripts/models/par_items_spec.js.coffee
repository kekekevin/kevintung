describe "ParItems Collection", ->

  beforeEach ->
    @parItems = new KevinTung.ParItems()

  it "should have the correct url", ->
    expect(@parItems.url).toBe("/par_items")

  it "can add par items", ->
    parItem = new KevinTung.ParItem(
      name: "foo"
      description: "bar"
    )

    @parItems.add(parItem)

    expect(@parItems.length).toBe(1)
