window.KevinTung ||= {}

ParSheetItemView = Backbone.View.extend(
  className: 'sheet_item'
  template: HandlebarsTemplates['par_sheet_item']
  render: ->
    @$el.html( @template(@model.toJSON()) )
    this
)

window.KevinTung.ParSheetItemView = ParSheetItemView
