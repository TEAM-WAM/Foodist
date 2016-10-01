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
          <div className="row">
            <div className="col-lg-4 col-lg-offset-6">
              <form id="new-group-form" className="form-group" onSubmit={this.handleGroupList.bind(this)}>
                Title:<br/>
                <input className="form-control" ref='groupListTitle' type='text' name='title'/><br/><br/>
                <button className="btn btn-danger" type='submit'>Create Group List</button><br/>
              </form>
            </div>
          </div>
          : <div className="row">

          </div>
        }
        <Lists url={groupListUrl} />
      </div>
    )
  }
}
