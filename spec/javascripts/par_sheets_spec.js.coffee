#= require jquery
#= require par_sheets
#= require handlebars
#= require bootstrap

describe "Par Sheets", ->
  parSheets = KevinTung.parSheets
  beforeEach ->
    loadFixtures 'par_sheets_fixture'
    parSheets.init()

  describe "add item", ->
    it "should add a new item row", ->
      parSheets.addItem()
      expect($('.sheet_item').length).toBe(2)
  describe "remove item", ->
    beforeEach ->
      spyOn($, 'ajax')
      parSheets.removeItem.apply($('.sheet_item')[0])

    it "should remove an item row", ->
      expect($('.sheet_item:visible').length).toBe(0)
    
    it "should change the destroy attribute to true", ->
      expect($('[id$=_destroy]').val()).toBe('true')

  describe "open create item modal", ->
    it "should show the create item modal", ->
      parSheets.openCreateItemModal()
      expect($('.modal:visible').length).toBe(1)
  
  describe "close create item modal", ->
    it "should hide the create item modal", ->
      parSheets.closeCreateItemModal()
      expect($('.modal:visible').length).toBe(1)

    it "should reset the form", ->
      $('.modal input').val('foobar')
      parSheets.closeCreateItemModal()
      expect($('.modal input').val()).toBe('original')

  describe "add select option", ->
    it "should add the option to the select tag", ->
      parSheets.addSelectOption('name', 'id')
      expect($('.item-select option').length).toBe(1)
      expect($('.item-select option').val()).toBe('id')
      expect($('.item-select option').text()).toBe('name')

  describe "create item", ->
    beforeEach ->
      spyOn($, 'ajax').andCallFake (params) ->
        params.success(
          name: 'foo'
          id: 'bar'
        )
      parSheets.createItem()

    it "should persist the data", ->
      expect($.ajax).toHaveBeenCalled()

    it "should add a select option with the saved item", ->
      expect($('.item-select option').length).toBe(1)

    it "should close the modal", ->
      expect($('.modal:visible').length).toBe(1)
