class Groups extends React.Component {

  constructor() {
    super();
    this.state = {
      groups: [],
      toggleForm: false
    }
  }

  toggle(ev) {
    ev.preventDefault();
    this.setState({toggleForm: !this.state.toggleForm})
  }

  componentDidMount() {
    this.setState({groups: this.props.groups})
  }

  handleUpdateGroups(event) {
    event.preventDefault();

    var data = {
      group: {
        name: this.refs.groupName.value,
        description: this.refs.groupDescription.value,
        creator_id: this.props.user_id
      }
    }

    $.post('/groups', data)
      .done((response) => {
        this.setState({groups: this.state.groups.concat(response)})
        this.refs.groupName.value = '';
        this.refs.groupDescription.vaule = ''
        this.setState({toggleForm: false});
      })
  }


  render() {
    return(
      <div>

        <h3><a onClick={this.toggle.bind(this)} href=''>
        {this.state.toggleForm ?
            <i> Hide Form </i>
          :<i>Create A Group List Restaurant For You And Your Friends</i>
        }</a></h3><br/>

        {this.state.toggleForm ?
          <form onSubmit={this.handleUpdateGroups.bind(this)}>
            Name:<br/>
            <input ref='groupName' type="text" name='group[name]'/><br/>
            Description:<br/>
            <input ref='groupDescription' type='text' name='group[description]'/><br/><br/>
            <input type='submit' value='Create Group' />
          </form>
          : null
         }
         <br/>
        <ul id='groups-list'>
          {this.state.groups.map((group, i) => {
            return(<li key={i}><Group user_id={this.props.user_id} group={group}/></li>)
          })}
        </ul>
      </div>
    )
  }
}
