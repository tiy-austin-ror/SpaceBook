var RoomSearch = React.createClass({

    getInitialState: function(){
      return {
        allRooms: [],
        filteredRooms: [],
        search: ""
      };
    },

    filterList: function(e){
       var searchReturn = this.state.allRooms.filter(function (room) {
         return (room.name.toLowerCase().indexOf(e.target.value.toLowerCase()) !== -1 ||
                 room.capacity == e.target.value ||
                 room.location.toLowerCase().indexOf(e.target.value.toLowerCase()) !== -1 );
       });
       this.setState({
         filteredRooms: searchReturn,
         search: e.target.value
       });
     },


    componentDidMount: function () {
      $.ajax({
        url: '/campuses/' + this.props.campusID + '/rooms.json',
        dataType: 'JSON',
        method: 'get'
      }).done(function (response) {
        this.setState({
          allRooms: response,
          filteredRooms: response
        });
      }.bind(this));
    },

    render: function() {
      return (
        <section>
          <div>
            <input className='form-control' type='text'
              onChange={this.filterList} value={this.state.search}
              placeholder='What are you looking for?' />
          </div>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th>Room Name:</th>
                  <th>Room Location:</th>
                  <th>Room Capacity:</th>
                  <th>Room Amenities</th>
                </tr>
              </thead>
              <tbody>
                {this.state.filteredRooms.map(function (room) {
                  return (
                    <tr key={room.id} >
                      <td><a href={'/campuses/' + room.campus_id + '/rooms/' + room.id}> {room.name} </a></td>
                      <td>{room.location}</td>
                      <td>{room.capacity}</td>
                      {room.room_amenities.map(function (amenity) {
                          return (<td key={amenity.id}>{amenity.name}</td>)
                      })}
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
