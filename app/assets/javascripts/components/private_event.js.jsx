var PrivateEvent = React.createClass({
  getInitialState: function () {
    return {
      private: false
    };
  },

  handlePrivateClick: function () {
    this.setState({
      private: true
    });
  },

  handlePublicClick: function () {
    this.setState({
      private: false
    });
  },

  render: function(){
    return (
      <div>
        <div className="row">
          <span className="col-sm-3 col-md-2"> <span className="sm-margin-right"> Public</span>
            <input type="radio"
                   name="event[private]"
                   value="false" defaultChecked
                   onClick={this.handlePublicClick}/>
          </span>
          <span className="col-sm-3 col-md-2 sm-margin-right"> <span className="sm-margin-right">Private</span>
            <input type="radio"
                   name="event[private]"
                   value="true"
                   onClick={this.handlePrivateClick}/>
          </span>
        </div>
        <OpenInvite private={this.state.private} />
      </div>
    );
  }
});
