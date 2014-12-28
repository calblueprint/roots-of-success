var routes = (
  <Route name="teacher_dashboard" path="/" handler={TeacherDashboard}>
    <Route name="teacher_edit" path="/teachers/:id/edit" handler={TeacherEdit}/>
    <DefaultRoute handler={TeacherDashboardMain}/>
  </Route>
);

Router.run(routes, function (Handler) {
  React.render(<Handler/>, document.getElementById("teacher-router"));
});
