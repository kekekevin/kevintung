window.KevinTung ||= {}

ParSheetItemView = Backbone.View.extend(
  initialize: ->
    console.log 'par sheet item view initialized'
  className: 'sheet_item control-group row-fluid'
  template: HandlebarsTemplates['par_sheet_item']
  render: ->
    @$el.html( @template(@model.toJSON()) )
    this
  events:
    'click .remove': 'removeItem'
  removeItem: ->
    @model.destroy()
    @remove()
)

window.KevinTung.ParSheetItemView = ParSheetItemView
