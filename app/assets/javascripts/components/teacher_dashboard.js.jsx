var Locations = ReactRouter.Locations;
var Location = ReactRouter.Location;

var TeacherDashboard = React.createClass({
  render: function() {
    return (
      <div>
        <Header/>
        <div className="spacer"></div>
        <Locations ref="router">
          <Location path="/teachers/dashboard" handler={TeacherEdit} />
          <Location path="/teachers/:id/edit" handler={TeacherEdit} />
        </Locations>
      </div>
    );
  }
});
