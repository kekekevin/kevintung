window.KevinTung ||= {}

ParSheetView = Backbone.View.extend(

  el: ".par_sheet"

  initialize: () ->
    console.log "par item select view initialized"
    @inventory = new KevinTung.ParSheetItems()
    @inventory.url = "/par_sheets/#{@model.id}/par_sheet_items"
    @item_collection = new KevinTung.ParItems()
    @inventory.fetch(
      success: =>
        @item_collection.fetch(
          reset: true
        )
    )

    @listenTo( @item_collection, "reset", @render )
    @listenTo( @item_collection, "add", @renderNewOption )
    @listenTo( @inventory, "add", @renderItem )

  template: HandlebarsTemplates["par_sheet"]

  events:
    "click .save": "createItem"
    "click .create_item": "openCreateItemModal"
    "click .add_item": "addItem"
    "click .cancel": "closeCreateItemModal"
    "focusout #name": "saveSheet"
    
  render: ->
    @$el.empty()
    @$el.prepend( @template( @model.toJSON()) )
    @inventory.each (item) =>
      @renderItem(item)
    @inventory.each (item) =>
      @selectItem(item)

  renderItem: (item) ->
    parSheetItemView = new KevinTung.ParSheetItemView(
      model: item
    )
    $(".sheet_items", @el).append( parSheetItemView.render().el )
    @item_collection.each (option) =>
      @renderOption(option, parSheetItemView.el)

  renderNewOption: (option) ->
    $(".sheet_item", @el).each (sheetItem) =>
      @renderOption(option, sheetItem)
      
  renderOption: (option, sheetItem) ->
    parItemView = new KevinTung.ParItemView(
      model: option
    )
    $("select", sheetItem).append( parItemView.render().el )

  selectItem: (item) ->
    $("input[value=#{item.get("id")}] ~ select", @el).val(item.get("par_item_id"))

  createItem: (e) ->
    formData = {}
    $(".modal input").each (index, el) ->
      formData[el.id] = $(el).val()

    @item_collection.create(formData)
    $(".modal").modal("hide")

  openCreateItemModal: ->
    $(".modal").modal()

  closeCreateItemModal: ->
    $(".modal").modal("hide")

  addItem: ->
    item = new KevinTung.ParSheetItem(
      par_sheet_id: @model.id
    )
    @inventory.create(item)

  saveSheet: ->
    @model.set("name", $("#name", @el).val())
    @model.save()

)

window.KevinTung.ParSheetView = ParSheetView
