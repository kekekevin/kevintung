window.KevinTung ||= {}

ParSheetItems = Backbone.Collection.extend(
  model: KevinTung.ParSheetItem
  url: "/par_sheet_items"
)

window.KevinTung.ParSheetItems = ParSheetItems
