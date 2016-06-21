# Javascript for the teachers/students/index page.

# This function initializes the jQuery DataTable for this page. See
# https://datatables.net/examples/basic_init/dom.html
studentDatatable = ->
  $table = $("#students-table")
  return unless $table.length

  $table.DataTable
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

# Shows a toastr message when the resend confirmation link is clicked
confirmationResent = ->
  $(".js-resend-confirmation").on "ajax:success", (e, data) ->
    toastr.success data.message

# Re-renders the student row when the survey adminstered link is clicked
# TODO(sam): I gave up on this cause it was just too much trouble :(
# surveyStateToggled = ->
#   $(".js-survey-taken").on "ajax:success", (e, data) =>
#     toastr.success data.message

#     $table.dataTable().fnAddData(data.rowData)


ready studentDatatable, confirmationResent
