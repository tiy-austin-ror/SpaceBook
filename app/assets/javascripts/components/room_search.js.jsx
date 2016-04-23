var RoomSearch = React.createClass({

    getInitialState: function(){
      return {
        search_return: [],
        all_rooms: [],
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
          </div>
          <div>
            {this.state.search_return.map(function (room) {
              return (
                <ul>
                  <li>{current_user.campus.city}<li>
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
              );
            })};
          </div>
        </section>
      );
    },
});
