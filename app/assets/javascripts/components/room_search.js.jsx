var RoomSearch = React.createClass({

    getInitialState: function(){
      return {
        search_return: []
        all_rooms: []
        search: ''
      };
    },

    componentDidMount: function () {
      $.ajax({
        url: '/campuses/:campus_id/rooms',
        dataType: 'JSON',
        method: 'get'
      }).done(function (response) {
        this.setState({
          search_return: response,
          all_rooms: reponse
        });
      }.bind(this));
    },
    handleChange: function(e){
        var search_return = this.state.all_rooms.filter(function (room) {
          return (room.name.toLowerCase().indexOf(e.target.value.toLowerCase()) > -1);
        });
        this.setState({
          search: e.target.value,
          search_return: search_return
        });
    },

    render: function() {
      return (
        <section>
          <div>
            <input className='container' type='text'
              onChange={this.handleChange} value={this.state.search}
              placeholder='Type Here' />
          <div>
          <div>
            <table className="table">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Location</th>
                  <th>Capacity</th>
                  <th>Amenities</th>
                </tr>
              </thead>
              <tbody>
                {this.state.search_return.map(function (room) {
                  return (
                    <tr>
                      <td>{ room.name }</td>
                      <td> { room.location }</td>
                      <td> { room.capacity }</td>
                      { room.amenities.each do |amenity| }
                      <td> {amenity.name} </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </section>
    );
  },
});
);
