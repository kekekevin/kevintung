window.KevinTung ||= {}

ParItemView = Backbone.View.extend(
  tagName: 'option'
  template:  HandlebarsTemplates['par_item']
  render: ->
    @$el.val( @model.get('id'))
    @$el.text( @model.get('name'))
    this
)

window.KevinTung.ParItemView = ParItemView
