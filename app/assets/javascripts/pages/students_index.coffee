studentDatatable = ->
  $("#students-table").DataTable
    paging: false
    info: false
    dom: '<"#add-students-button">frtip'

  $("#add-students-button").html(
    '<a href="' + gon.addStudentsUrl + '" class="button success">Add Students</a>'
  )

ready studentDatatable
