class Comment extends React.Component{
  render(){
    return(
          <li>
          <div>
            <a href= "/profiles/{this.props.data.user.id}">{this.props.data.user.username}</a>
          </div>
          <div>
              {this.props.data.body}
          </div>
          </li>
    );
  }
}


