class Lists extends React.Component{
  constructor(){
    super();
    this.state = { lists: []
    }
  }

  componentDidMount(){
    url = "/j/lists" + this.props.url
  fetch(url)
  .then((response)=> {return(response.json())})
  .then((jsonresponse) => {this.setState({lists: jsonresponse.lists})})
}

  render(){
    if(this.state.lists.length == null){
      lists = <List dataId="list1" data={this.state.lists} votes={this.state.lists.vote_count} user_id={this.props.user_id} parent_id={this.state.lists.id} type="List"/>
    }
    else {
        lists = this.state.lists.map((list, i) => {
          return( <List dataId={i} data={list} key={i} votes={list.vote_count} user_id={this.props.user_id} parent_id={list.id} type="List" /> )
        })
    }
    return(
      <div className="container">
        {lists}
      </div>
    )
  }
}
