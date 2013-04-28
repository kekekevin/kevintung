window.KevinTung ||= {}

ParItemView = Backbone.View.extend(
  tagName: 'option'
  template:  HandlebarsTemplates['par_item']
  render: ->
    @$el.html( @template(@model.toJSON()) )
    this
)

window.KevinTung.ParItemView = ParItemView
