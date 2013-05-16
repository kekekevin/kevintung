window.KevinTung ||= {}

ParItems = Backbone.Collection.extend(
  model: KevinTung.ParItem
  url: '/par_items'
)

window.KevinTung.ParItems = ParItems
