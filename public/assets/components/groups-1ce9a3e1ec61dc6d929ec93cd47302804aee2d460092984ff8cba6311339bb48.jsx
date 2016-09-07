class Groups extends React.Component {

  render() {
    return(
      <div className='groups'>

        <h1>Groups</h1>

        <h3>All groups that have been created:</h3>

        <form>
          Name:<br/>
          <input type="text" name='name'/><br/>
          Description:
          <input type='text' name='description'/>
          <input type='submit' value='Create Group' />
        </form>

        <ul id='groups-list'>
          <p>Description: {this.props.group.description}</p>
        </ul>
      </div>
    )
  }
}
