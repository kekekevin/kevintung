window.KevinTung ||= {}

ParSheetItem = Backbone.Model.extend(
  initialize: ->
    console.log("par sheet item initialized")
  defaults:
    par_count: "1"
)

window.KevinTung.ParSheetItem = ParSheetItem
