var EventInvites = React.createClass({
  propTypes: {
    users: React.PropTypes.array
  },

  getInitialState: function () {
    return {
      filterQuery: ''
    };
  },



  handleChange: function (event) {
    this.setState({
      filterQuery: event.target.value
    });
  },

  render: function(){
    var that = this;
    return (
      <div>
        <label><strong>Invite: </strong>
          <input type="text"
                 placeholder="name"
                 onChange={this.handleChange}/>
        </label>
        {this.props.users.map(function(user) {
          var reg = new RegExp(that.state.filterQuery, "i");
          if (user.name.match(reg)) {
            return (
              <div key={user.id}> {user.name} </div>
            );
          }

        })}
      </div>
    );
  }
});
