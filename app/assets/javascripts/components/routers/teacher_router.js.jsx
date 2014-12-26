var Router = ReactRouter;
var Route = Router.Route;
var NotFoundRoute = Router.NotFoundRoute;
var DefaultRoute = Router.DefaultRoute;
var Link = Router.Link;
var RouteHandler = Router.RouteHandler;

var routes = (
  <Route name="teacher_dashboard" path="/teachers/dashboard" handler={TeacherDashboard}>
    <Route name="teacher_edit" path="/teachers/:id/edit" handler={TeacherEdit}/>
    <DefaultRoute handler={TeacherDashboardMain}/>
  </Route>
);

Router.run(routes, function (Handler) {
  React.render(<Handler/>, document.body);
});
