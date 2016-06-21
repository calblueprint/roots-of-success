# Javascript for the teachers/students/index page.

# This function initializes the jQuery DataTable for this page. See
# https://datatables.net/examples/basic_init/dom.html
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
