var CommentsContainer = React.createClass({
  getInitialState: function() {
    return {
      comments: []
    };
  },
  tick: function() {
    var that = this;
    this.setState({secondsElapsed: this.state.secondsElapsed + 1});
    $.getJSON(url, function(response){
      that.setState({
        comments: response
      })
    }
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

// var url = document.URL;
// var commentsContainer = $("#comments-container");
//
// if (window.location.pathname.split('/').includes("events")) {
//   var getHTML = function(comment) {
//       return '<strong class="sm-margin-right">' + comment.user_name + '</strong> |' +
//       '<em class="sm-padding-left">' + comment.created_time + '</em>' +
//       '<div>' +
//         '-> '+ comment.body +
//       '</div>';
//   };
//   var jsonComments = function () {
//       $.getJSON(url, function(response){
//             commentsContainer.html("")
//             response.forEach(function(comment) {
//                  commentsContainer.append(getHTML(comment));
//              });
//         });
//   };
//   jsonComments();
//   refreshComments = setInterval(function () {
//       jsonComments();
//   }, 1000);
// }
