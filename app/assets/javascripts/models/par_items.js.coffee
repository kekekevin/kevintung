window.KevinTung ||= {}

ParItems = Backbone.Collection.extend(
  model: KevinTung.ParItem
  url: 'api/par_items'
)

window.KevinTung.ParItems = ParItems
