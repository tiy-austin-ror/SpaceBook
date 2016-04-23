var OpenInvite = React.createClass({
  render: function(){
    if (this.props.private === true) {
      return (
        <div className="row">
          <span className="col-sm-3 col-md-2"> <span className="sm-margin-right">Open Invite</span>
            <input type="radio"
                   name="event[open_invite]"
                   value="true" defaultChecked/>
          </span>
          <span className="col-sm-3 col-md-2 sm-margin-right"> <span className="sm-margin-right">Closed Invite</span>
            <input type="radio"
                   name="event[open_invite]"
                   value="false"
                   onClick={this.handlePrivateClick}/>
          </span>
        </div>
      );
    }else {
      return(<span />);
    }
  }
});
