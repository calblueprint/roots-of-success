ready = ->
  $('#students').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#students').data('source')

$(document).ready(ready)
$(document).on('page:load',ready)
