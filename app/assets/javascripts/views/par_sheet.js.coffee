window.KevinTung ||= {}

ParSheetView = Backbone.View.extend(
  el: '.par_sheets'
  initialize: () ->
    console.log 'par item select view initialized'
    @collection = new KevinTung.ParItems()
    @collection.fetch(
      reset: true
    )
    @render()

    @listenTo( @collection, 'reset', @render )
    @listenTo( @collection, 'add', @render )
  render: ->
    @collection.each (item) =>
      @renderItem(item)
  renderItem: (item) ->
    parItemView = new KevinTung.ParItemView(
      model: item
    )
    $('select', @el).append( parItemView.render().el )
  events:
    'click .save': 'addItem'
  addItem: (e) ->
    formData = {}
    $('.modal input').each (index, el) ->
      formData[el.id] = $(el).val()

    @collection.create(formData)
)

window.KevinTung.ParSheetView = ParSheetView
