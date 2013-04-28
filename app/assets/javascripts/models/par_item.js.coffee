window.KevinTung ||= {}

ParItem = Backbone.Model.extend(
  defaults:
    name: ''
    description: ''
  initialize: ->
    console.log 'par item initialized'
)

window.KevinTung.ParItem = ParItem
