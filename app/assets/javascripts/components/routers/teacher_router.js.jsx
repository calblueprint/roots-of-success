var routes = (
  <Route name="teacher_dashboard" path="/" handler={TeacherDashboard}>
    <Route name="teacher_edit" path="/teachers/:id/edit" handler={TeacherEdit}/>
    <Route name="classroom_show" path="/teachers/:teacher_id/classrooms/:id" handler={ClassroomShow}/>
    <DefaultRoute handler={TeacherDashboardMain}/>
  </Route>
);

Router.run(routes, function (Handler) {
  React.render(<Handler currentTeacherId={gon.currentTeacherId}
                        currentTeacher={gon.currentTeacher}/>,
               document.getElementById("teacher-router"));
});
