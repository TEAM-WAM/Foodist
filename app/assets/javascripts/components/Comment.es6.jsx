class Comment extends React.Component{

  render(){
    var link = '/profiles/' + this.props.data.user.profile_id
    return(
          <break>
          <li className="list-group-item">
          <div>
            <a href= {link}>{this.props.data.user.username}</a>
          </div>
          <div>
              {this.props.data.body}
          </div>
            <Votes
              vote={this.props.votes}
              parent_id={this.props.parent_id}
              parent_class={this.props.type}
              user_id={this.props.user_id}
            />
          </li>
          </break>

    );
  }
}
