window.KevinTung ||= {}

ParSheetView = Backbone.View.extend(
  el: '.par_sheet'
  initialize: () ->
    console.log 'par item select view initialized'
    @inventory = new KevinTung.ParSheetItems()
    @inventory.url = "/par_sheets/#{@model.id}/par_sheet_items"
    @item_collection = new KevinTung.ParItems()
    @inventory.fetch(
      success: =>
        @item_collection.fetch(
          reset: true
        )
    )

    @listenTo( @item_collection, 'reset', @render )
    @listenTo( @item_collection, 'add', @renderOption )
  template: HandlebarsTemplates['par_sheet']
  render: ->
    @$el.prepend( @template( @model.toJSON()) )
    @inventory.each (item) =>
      @renderItem(item)
    @item_collection.each (option) =>
      @renderOption(option)
    @inventory.each (item) =>
      @selectItem(item)
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
  selectItem: (item) ->
    $("input[value=#{item.get('id')}] ~ select", @el).val(item.get('par_item_id'))
  events:
    'click .save': 'addItem'
    'click .create_item': 'openCreateItemModal'
  addItem: (e) ->
    formData = {}
    $('.modal input').each (index, el) ->
      formData[el.id] = $(el).val()

    @item_collection.create(formData)
    $('.modal').modal('hide')
  openCreateItemModal: ->
    $('.modal').modal()
)

window.KevinTung.ParSheetView = ParSheetView
