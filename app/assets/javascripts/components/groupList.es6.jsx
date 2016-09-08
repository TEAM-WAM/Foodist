class GroupList extends React.Component {

  constructor() {
    super();
    this.state = {
      // lists: [],
      toggleForm: false
    }
  }

  toggle(ev) {
    ev.preventDefault();
    this.setState({toggleForm: !this.state.toggleForm})
  }

  handleGroupList(ev) {
    ev.preventDefault();

    var data = {
      list: {
        title: this.refs.groupListTitle.value,
        listable_id: this.props.group.id
      }
    }
    var url = "/lists/groups/"+ this.props.group.id +"/new"
    $.get(url, data)
      .done((response) => {
        // this.setState({lists: this.state.lists.concat([response])})
        this.refs.groupListTitle.value = '';
        this.setState({toggleForm: false});
      })

  }

  render() {
    groupListUrl= '/groups/' + this.props.group.id
    return(
      <div>
        <h3><a onClick={this.toggle.bind(this)} href=''>
        {this.state.toggleForm ?
            <i> Hide Form </i>
          :<i> Create a new list For {this.props.group.name}</i>
        }</a></h3>

        {this.state.toggleForm ?
          <form onSubmit={this.handleGroupList.bind(this)}>
            Title:<br/>
            <input ref='groupListTitle' type='text' name='title'/><br/><br/>
            <input type='submit' name='Create Group List'/><br/>
          </form>
          : null
        }
        <Lists url={groupListUrl} />
      </div>
    )
  }
}
