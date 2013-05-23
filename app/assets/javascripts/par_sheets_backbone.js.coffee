$ ->
  if $(".par_sheets_backbone").length
    sheet = new KevinTung.ParSheet(
      id: 3
    )
    sheet.fetch(
      success: ->
        sheetView = new KevinTung.ParSheetView(
          model: sheet
        )
    )
