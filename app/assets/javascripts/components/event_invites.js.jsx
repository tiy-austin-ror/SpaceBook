var EventInvites = React.createClass({
  propTypes: {
    users: React.PropTypes.array
  },

  getInitialState: function () {
    return {
      filterQuery: ''
    };
  },

  handleSendInvite: function () {
    $.ajax({
      method: "POST",
      url: "/invites"

    })
  },

  handleChange: function (event) {
    this.setState({
      filterQuery: event.target.value
    });
  },

  handleSelect:function (user) {
    console.log(user.id);
    this.setState({
      filterQuery: user.name
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
