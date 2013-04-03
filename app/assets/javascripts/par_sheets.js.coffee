parSheets = do ->
  init: ->
    $('.add_item').click(parSheets.addItem)
    $('.remove').click(parSheets.removeItem)
  addItem: ->
    source = $('#sheet_item_template').html()
    template = Handlebars.compile(source)
    context =
      index: $('.sheet_item').length
    $('#sheet_items').append(template(context))
    $('.remove').click(parSheets.removeItem)
  removeItem: ->
    $(this).closest('.sheet_item').remove()

window.parSheets = parSheets

jQuery ->
  if $('.par_sheets').length
    parSheets.init()
