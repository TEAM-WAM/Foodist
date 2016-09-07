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
      lists = <List dataId="list1" data={this.state.lists}/>
    }
    else {
        lists = this.state.lists.map((list, i) => {
          return( <List dataId={i} data={list} key={i} /> )
        })
    }
    return(
      <div className="container">
        {lists}
      </div>
    )
  }
}
