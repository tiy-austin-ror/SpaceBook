var EventInvites = React.createClass({
  propTypes: {
    users: React.PropTypes.array,
    event_id: React.PropTypes.number
  },

  getInitialState: function () {
    return {
      filterQuery: '',
      user_id: ''
    };
  },

  handleSendInvite: function () {
    var that = this;
    $.ajax({
      method: "POST",
      url: "/invites",
      data: {
        invite: {
          user_id: this.state.user_id,
          event_id: this.props.event_id
        }
      }
    }).done(function(response){
      that.setState({
        filterQuery: ''
      });
    });
  },

  handleChange: function (event) {
    this.setState({
      filterQuery: event.target.value
    });
  },

  handleSelect:function (user) {
    console.log(user.id);
    this.setState({
      filterQuery: user.name,
      user_id: user.id
    });
  },


  render: function(){
    var that = this;
    return (
      <div>
        <label><strong>Invite: </strong>
          <input type="text"
                 className="form-control"
                 placeholder="name"
                 value={this.state.filterQuery}
                 onChange={this.handleChange}/>
        </label>
        <label>
          <input type="button"
                 className="btn btn-primary"
                 value="Send Invite"
                 onClick={this.handleSendInvite} />
        </label>
        <div className="dropdown">
        {this.props.users.map(function(user) {
          var reg = new RegExp(that.state.filterQuery, "i");
          if ((that.state.filterQuery !== "") && (user.name.match(reg))) {
            return (
              <div onClick={that.handleSelect.bind(that, user)} value={user.name} className="dropdown-item" key={user.id}> {user.name} </div>
            );
          }


        })}
        </div>
      </div>
    );
  }
});
