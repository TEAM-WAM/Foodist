class Comment extends React.Component{
  render(){
    var link = '/profiles/' + this.props.data.user.profile_id
    return(
          <li className="list-group-item">
          <div>
            <a href= {link}>{this.props.data.user.username}</a>
          </div>
          <div>
              {this.props.data.body}
          </div>
          </li>
    );
  }
}


