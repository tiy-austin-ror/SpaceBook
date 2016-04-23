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
    return (
      <div>
        <label><strong>Invite: </strong>
          <input type="text"
                 placeholder="name"
                 onChange={this.handleChange}/>
        </label>
        {this.props.users.map(function(user) {
          return (
            <div> {user.name} </div>
          );
        })}
      </div>
    );
  }
});
