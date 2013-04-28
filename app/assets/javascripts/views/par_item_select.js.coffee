window.KevinTung ||= {}

ParItemSelectView = Backbone.View.extend(
  el: 'select'
  initialize: () ->
    console.log 'par item select view initialized'
    @collection = new KevinTung.ParItems()
    @collection.fetch(
      reset: true
    )
    @render()

    @listenTo( @collection, 'reset', @render )
  render: ->
    @collection.each (item) =>
      @renderItem(item)
  renderItem: (item) ->
    parItemView = new KevinTung.ParItemView(
      model: item
    )
    @$el.append( parItemView.render().el )
)

window.KevinTung.ParItemSelectView = ParItemSelectView
