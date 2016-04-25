var Rooms = React.createClass({
  render: function(){
    return (
      <ul>
      {
        this.props.items.map(function(room) {
          return <li key={name}>{name}</li>
        })
       }
      </ul>
    )
  }
});

var RoomSearch = React.createClass({

    filterList: function(e){
       var searchReturn = this.state.initialItems;
       var searchReturn = this.state.all_rooms.filter(function (room) {
         return (room.name.toLowerCase().indexOf(e.target.value.toLowerCase()) > -1);
       });
       this.setState({rooms: searchReturn});
     },

    getInitialState: function(){
      return {
        searchReturn: [],
        allRooms: [],
        search: ""
      };
    },

    componentDidMount: function () {
      $.ajax({
        url: 'api/campuses/:campus_id/rooms',
        dataType: 'JSON',
        method: 'get'
      }).done(function (response) {
        this.setState({
          searchReturn: response,
          allRooms: reponse
        });
      }.bind(this));
    },

    render: function() {
      return (
        <section>
          <div>
            <input className='container' type='text'
              onChange={this.filterList} value={this.state.search}
              placeholder='Type Here' />
          </div>
          <div>
            {this.state.searchReturn.map(function (room) {
              return (
                <ul>
                  <li>{current_user.campus.city}</li>
                  <li>{room.name}</li>
                  <li>{room.location}</li>
                  <li>{room.capacity}</li>
                  <li>{this.state.room.amenities.map(function (amenity) {
                      (<Amenity
                      key={amenity.id}
                      name={amenity.name}
                      />)
                      })}
                  </li>
                </ul>
              );
            })};
          </div>
        </section>
      );
    },
});
ReactDOM.render(
  <RoomSearch url="/api/campuses/:campus_id/rooms" pollInterval={2000} />,
  document.getElementById('rooms')
);
