window.KevinTung ||= {}

ParSheetRouter = Backbone.Router.extend(

  routes:
    "edit/:id": "getParSheet"

  getParSheet: (id) ->
    sheet = new KevinTung.ParSheet(
      id: id
    )
    sheet.fetch(
      success: ->
        sheetView = new KevinTung.ParSheetView(
          model: sheet
        )
    )
    
)

window.KevinTung.ParSheetRouter = ParSheetRouter
