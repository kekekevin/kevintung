window.KevinTung ||= {}

ParSheet = Backbone.Model.extend(
  defaults:
    name: ""
  initialize: ->
    console.log "par sheet initialized"
  urlRoot: "/par_sheets"
)

window.KevinTung.ParSheet = ParSheet
