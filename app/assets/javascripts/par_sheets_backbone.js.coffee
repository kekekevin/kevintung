window.KevinTung ||= {}

parSheetsBackbone = do ->
  init: ->
    $('.create_item').click(parSheetsBackbone.openCreateItemModal)
    $('.modal .cancel').click(parSheetsBackbone.closeCreateItemModal)
    $('.modal .close').click(parSheetsBackbone.closeCreateItemModal)
    $('.modal .save').click(parSheetsBackbone.createItem)
    itemSelectView = new KevinTung.ParItemSelectView()
  openCreateItemModal: ->
    $('.modal').modal()
  closeCreateItemModal: ->
    $('.modal').modal('hide')
  createItem: ->
    data = $('.modal form').serialize()

    $.ajax(
      url: '/par_items.json'
      type: 'POST'
      data: data
      success: parSheets.successfulCreateItemCallback
    )
  successfulCreateItemCallback: (result) ->
    parSheets.closeCreateItemModal()

$ ->
  if $('.par_sheets_backbone').length
    parSheetsBackbone.init()
