var InviteCard = React.createClass({
  render: function(){
    return (
      <div>
      <strong className="sm-margin-right">  {this.props.user_name}  </strong> |
            <em className="sm-padding-left">  {this.props.status}  </em>
      </div>
    );
  }
});
