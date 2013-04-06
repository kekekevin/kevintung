#= require jquery
#= require par_sheets
#= require handlebars

describe "Par Sheets", ->
  describe "add item", ->
    it "should add a new item row", ->
      loadFixtures 'par_sheets_fixture'
      parSheets.init()
      parSheets.addItem()
      expect($('.sheet_item').length).toBe(2)
  describe "remove item", ->
    it "should remove an item row", ->
      loadFixtures 'par_sheets_fixture'
      parSheets.init()
      parSheets.removeItem.apply($('.sheet_item')[0])
      expect($('.sheet_item:visible').length).toBe(0)
    
    it "should change the destroy attribute to true", ->
      loadFixtures 'par_sheets_fixture'
      parSheets.init()
      parSheets.removeItem.apply($('.sheet_item')[0])
      expect($('[id$=_destroy]').val()).toBe('true')
