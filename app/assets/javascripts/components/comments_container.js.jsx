var CommentsContainer = React.createClass({
  getInitialState: function() {
    return {
      comments: []
    };
  },
  tick: function() {
    var that = this;
    var url = document.URL;
    $.getJSON(url, function(response){
      that.setState({
        comments: response.comments
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
      {this.state.comments.map(function(comment){
          return (
            <CommentCard
              key={comment.id}
              user_name={comment.user_name}
              created_time={comment.created_time}
              body={comment.body}
              />
          );
      })}
      </div>
    );
  }
});
