var CommentCard = React.createClass({
  return (
    <strong class="sm-margin-right">  {this.props.user_name}  </strong> |
          <em class="sm-padding-left">  {this.props.created_time}  </em>
          <div>
            ->  {this.props.comment.body}
          </div>
  );
});
