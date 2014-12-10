jQuery ->
  $('.best_in_place').best_in_place()
  $(".best_in_place").bind "ajax:success", ->
    $(this).closest("h1").effect "highlight"
    return
  $(".best_in_place").bind "ajax:error", ->
    $(this).closest("h1").effect "bounce"
    return
  #$('.author_dates .best_in_place').datepicker(
    #autoclose: true
    #clearBtn: true
    #format: "yyyy-mm-dd"
    #language: "pt-BR"
    #todayHighlight: true )
  #$("#datepicker").datepicker({
    #minDate: +1,
    #dateFormat:"yy-mm-dd"
    #language: "pt-BR"
  #})
  
  #$('.best_in_place').datepicker()
   #dateFormat: "dd/mm/yy"
   #minDate: "1"
   
  #$('.author_dates .best_in_place').datepicker(
    #dateFormat: 'yy'
    #minData: '1' )
    
  #$.datepicker.setDefaults
    #formatDate: 'yy'
  
    
#jQuery ($) ->
  #$.extend $.fn.datepicker.defaults,
    #dateFormat: "dd|mm|yy"
  #return
