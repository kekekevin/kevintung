jQuery ->
 if('.par_sheets').length
   $('.add_item').click ->
     source = $('#sheet_item_template').html()
     template = Handlebars.compile(source)
     context = 
       index: $('.sheet_item').length
     $('#sheet_items').append(template(context))
     $('.remove').click ->
       $(this).closest('.sheet_item').remove()

