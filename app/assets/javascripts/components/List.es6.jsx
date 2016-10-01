class List extends React.Component{
constructor(){
  super();
  this.state = {
    showChildren: false,
    showEditList: false,
    currentList: ''
  }
  this.editListTitle = this.editListTitle.bind(this)
  this.toggleEdit = this.toggleEdit.bind(this)
}

  componentDidMount(){
    this.setState({currentList: this.props.data.list})
  }

  toggleChildren(){
    this.setState({showChildren: !this.state.showChildren})
  }

  toggleEdit(){

    this.setState({showEditList: !this.state.showEditList})
    if(this.state.showEditList){
      this.refs.listTitle.title.focus()
    }
  }

  editListTitle(e){
    e.preventDefault();
    url = "/lists/" +  this.state.currentList.id
    $.ajax({
      url: url,
      type: 'PUT',
      data: {list: this.state.currentList,
              updating: 'title',
              title: this.refs.listTitle.title.value}
      }).done((response) => {this.setState({currentList: response})}.bind(this));

      this.toggleEdit()
  }

  render(){
    var dataId = "restaurants" + this.props.dataId
    var dataIdClass = "#" + dataId
    return(
    <div className="row List">
          <div className="row">

            <div className="col-md-2">
              <Votes
                  vote={this.props.votes}
                  parent_id={this.props.parent_id}
                  parent_class={this.props.type}
                  user_id={this.props.user_id}/>
            </div>
            <div className="col-md-8">
              {this.state.showEditList ?
                <h2><strong>
                  <form ref="listTitle" onSubmit={this.editListTitle.bind(this)}>
                    <input type="text" name="title" defaultValue={this.state.currentList.title} onfocusout={this.toggleChildren.bind(this)}/>
                  </form>
                </strong></h2>
                :
                <h2><strong>{this.state.currentList.title}</strong></h2>
              }
            </div>
            <div className="col-md-2">
              <i className="glyphicon glyphicon-edit" onClick={this.toggleEdit}></i>
            </div>
          </div>
          <div className="row">
            <a href={dataIdClass} data-toggle="collapse" onClick={this.toggleChildren.bind(this)} >
              {this.state.showChildren ?
                <i className="glyphicon glyphicon-chevron-up"></i> :
                <i className="glyphicon glyphicon-chevron-down"></i>
              }
            </a>
          </div>
      <div className="row collapse" id={dataId}>
        <div className="row" id="list_r_heads">
            {/* iterate this for field headers  */}
            <div className="col-xs-3">
              <strong>Restaurant</strong>
            </div>
             <div className="col-xs-3">
              <strong>Cuisine</strong>
            </div>
             <div className="col-xs-3">
              <strong>Location</strong>
            </div>
             <div className="col-xs-3">
              <strong>Visted</strong>
            </div>

        </div>
        {this.props.data.restaurants.map((list_r, i)=>{
              return(<ListRestaurant listId={this.props.data.list.id} key={i} dataId={i} data={list_r}/>)
            })}
      </div>
    </div>
    )
  }
}
