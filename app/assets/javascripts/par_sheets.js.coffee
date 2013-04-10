parSheets = do ->
  init: ->
    $('.add_item').click(parSheets.addItem)
    $('.remove').click(parSheets.removeItem)
    $('.create_item').click(parSheets.openCreateItemModal)
    $('.modal .cancel').click(parSheets.closeCreateItemModal)
    $('.modal .close').click(parSheets.closeCreateItemModal)
    $('.modal .save').click(parSheets.createItem)
  addItem: ->
    source = $('#sheet_item_template').html()
    template = Handlebars.compile(source)
    context =
      index: $('.sheet_item').length
    $('#sheet_items').append(template(context))
    $('.remove').click(parSheets.removeItem)
  removeItem: ->
    sheet_item = $(this).closest('.sheet_item')
    sheet_item.find('[id$=destroy]').val('true')
    sheet_item.hide()
  openCreateItemModal: ->
    $('.modal').modal()
  closeCreateItemModal: ->
    $('.modal').modal('hide')
  createItem: ->
    

window.parSheets = parSheets

jQuery ->
  if $('.par_sheets').length
    parSheets.init()
