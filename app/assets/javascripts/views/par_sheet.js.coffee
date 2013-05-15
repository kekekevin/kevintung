window.KevinTung ||= {}

ParSheetView = Backbone.View.extend(
  el: '.par_sheet'
  initialize: () ->
    console.log 'par item select view initialized'
    @inventory = new KevinTung.ParSheetItems()
    @inventory.fetch(
      reset: true
    )
    @item_collection = new KevinTung.ParItems()
    @item_collection.fetch(
      reset: true
    )
    @render()

    @listenTo( @item_collection, 'reset', @render )
    @listenTo( @item_collection, 'add', @render )
    @listenTo( @inventory, 'reset', @render )
  render: ->
    @inventory.each (item) =>
      @renderItem(item)
    @item_collection.each (option) =>
      @renderOption(option)
  renderItem: (item) ->
    parSheetItemView = new KevinTung.ParSheetItemView(
      model: item
    )
    $('.sheet_items', @el).append( parSheetItemView.render().el )
  renderOption: (option) ->
    parItemView = new KevinTung.ParItemView(
      model: option
    )
    $('select', @el).append( parItemView.render().el )
  events:
    'click .save': 'addItem'
  addItem: (e) ->
    formData = {}
    $('.modal input').each (index, el) ->
      formData[el.id] = $(el).val()

    @item_collection.create(formData)
)

window.KevinTung.ParSheetView = ParSheetView
