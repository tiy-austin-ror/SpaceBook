var PrivateEvent = React.createClass({
  render: function(){
    return (
      <div>
        <span className="col-sm-3 col-md-2"> <span className="sm-margin-right"> Public</span>
          <input type="radio" name="event[private]" value="false" />
        </span>
        <span className="col-sm-3 col-md-2 sm-margin-right"> <span className="sm-margin-right">Private</span>
          <input type="radio" name="event[private]" value="true" defaultChecked/>
        </span>
      </div>
    );
  }
});
