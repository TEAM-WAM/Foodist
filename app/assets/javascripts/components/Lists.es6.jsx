class Lists extends React.Component{
  constructor(){
    super();
    this.state = { lists: []
    }
  }

  componentDidMount(){
    url = "http://localhost:3000/j/lists" + this.props.url
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
      <div className="AllLists">
        {lists}
      </div>
    )
  }
}
