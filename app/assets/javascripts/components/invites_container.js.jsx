var InvitesContainer = React.createClass({
  getInitialState: function() {
    return {
      invites: []
    };
  },
  tick: function() {
    var that = this;
    var url = document.URL;
    $.getJSON(url, function(response){
      that.setState({
        invites: response.invites
      })
    });
  },
  componentDidMount: function() {
    this.interval = setInterval(this.tick, 1000);
  },
  componentWillUnmount: function() {
    clearInterval(this.interval);
  },
  render: function() {
    return (
      <div>
      {this.state.invites.map(function(invite){
          return (
            <InviteCard
              key={invite.id}
              user_name={invite.user_name}
              status={invite.status}
              />
          );
      })}
      </div>
    );
  }
});
