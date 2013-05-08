window.KevinTung ||= {}

parSheetsBackbone = do ->
  init: ->
    $('.create_item').click(parSheetsBackbone.openCreateItemModal)
    $('.modal .cancel').click(parSheetsBackbone.closeCreateItemModal)
    $('.modal .close').click(parSheetsBackbone.closeCreateItemModal)
    sheetView = new KevinTung.ParSheetView()
  openCreateItemModal: ->
    $('.modal').modal()
  closeCreateItemModal: ->
    $('.modal').modal('hide')

$ ->
  if $('.par_sheets_backbone').length
    parSheetsBackbone.init()
