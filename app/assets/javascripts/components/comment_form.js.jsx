var CommentForm = React.createClass({
  propTypes: {
    campus_id: React.PropTypes.number,
    room_id: React.PropTypes.number,
    event_id: React.PropTypes.number
  },

  getInitialState: function () {
    return {
      commentText: ''
    };
  },
  handleChange: function (event) {
    this.setState({
      commentText: event.target.value
    });
  },

  handlePostComment: function () {
    var that = this;
    $.ajax({
      method: "POST",
      url: "/comments.json",
      data: {
        comment: {
          body: this.state.commentText,
          campus_id: this.props.campus_id,
          room_id: this.props.room_id,
          event_id: this.props.event_id
        }
      }
    }).done(function(response){
      console.log(response);
      that.setState({
        commentText: ''
      });
    });
  },

  render: function(){
    return (
      <div className="container">
        <label><strong>New Comment: </strong>
          <textarea row={40} cols={40}
                 className="form-control-100"
                 placeholder="Hello World"
                 value={this.state.commentText}
                 onChange={this.handleChange}/>
        </label><br/>
        <label>
          <input type="button"
                 className="btn btn-primary"
                 value="Post Comment"
                 onClick={this.handlePostComment} />
        </label>
      </div>
    );

  }
});
