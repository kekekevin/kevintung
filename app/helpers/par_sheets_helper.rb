module ParSheetsHelper     
  def link_to_add_item(name, sheet)
    link_to name, "#", "data-partial" => render(partial:'sheet_item', object: ParSheetItem.new, locals: { sheet: sheet }), class: 'add_item'
  end
end
    
