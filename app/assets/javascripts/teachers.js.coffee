ready = ->
  $('#teachers').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#teachers').data('source')

$(document).ready(ready)
$(document).on('page:load',ready)
   
  
