jQuery ->
  $('.best_in_place').best_in_place()
  $('.best_in_place').bind 'ajax:success', ->
    $(this).closest('h1').effect 'highlight'
    return
  $('.best_in_place').bind 'ajax:error', ->
    $(this).closest('h1').effect 'bounce'
    return
    
  $.datepicker.setDefaults
    appendText: ' formato: dd/mm/aaaa'
    changeYear: true
    closeText: 'pronto'
    currentText: 'hoje'
    dateFormat: 'dd/mm/yy'
    maxDate: '0'
    showButtonPanel: true