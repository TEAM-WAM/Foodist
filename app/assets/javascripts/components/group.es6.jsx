class Group extends React.Component {

  render() {

    return(
        <div id='group-box'>
          <h3><a href={`/groups/${this.props.group.id}`}>{this.props.group.name}</a></h3>
          <div className="">
            <img src={this.props.group.avatar_file_name} />
          </div>
        </div>
    )
  }
}
