studentDatatable = ->
  return unless $("#students-table").length

  $("#students-table").DataTable
    paging: false
    info: false
    dom: '<"#add-students-button">frtip'
    columns: [
      { className: "dt-left", width: "50%"},
      { className: "dt-center" },
      { className: "dt-center" },
      { className: "dt-center", bSortable: false }
    ]

  $("#add-students-button").html(
    '<a href="' + gon.addStudentsUrl + '" class="button success">Add Students</a>'
  )

ready studentDatatable
