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
      lists = <List data={this.state.lists}/>
    }
    else {
        lists = this.state.lists.map((list, i) => {
          return( <List data={list} key={i} /> )
        })
    }
    return(
      <table className="AllLists table table-bordered">
        {lists}
      </table>
    )
  }
}
