window.KevinTung ||= {}

ParSheetItemView = Backbone.View.extend(
  initialize: ->
    console.log 'par sheet item view initialized'
  className: 'sheet_item control-group row-fluid'
  template: HandlebarsTemplates['par_sheet_item']
  events:
    'click .remove': 'removeItem'
    'focusout': 'saveItem'
  render: ->
    @$el.html( @template(@model.toJSON()) )
    this
  removeItem: ->
    @model.destroy()
    @remove()
  saveItem: ->
    @model.set('par_count', $('#par_count', @el).val())
    @model.set('par_item_id', $('#par_item_id', @el).val())
    @model.save()

)

window.KevinTung.ParSheetItemView = ParSheetItemView
