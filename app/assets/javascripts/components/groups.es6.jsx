class Groups extends React.Component {

  constructor() {
    super();
    this.state = {
      toggleForm: false
    }
  }

  toggle() {
    this.setState({showChildren: !this.state.showChildren})
  }

  render() {
    return(
      <div className='groups'>

        <a onClick={this.toggle.bind(this)} href=''>Create a group</a> 
        {this.state.toggleForm ?
          <form>
            Name:<br/>
            <input type="text" name='group[name]'/><br/>
            Description:
            <input type='text' name='group[description]'/>
            <input type='hidden' name='group[creator_id]' value={this.props.user_id} />
            <input type='submit' value='Create Group' />
          </form>
          :

        }

      </div>
    )
  }
}
