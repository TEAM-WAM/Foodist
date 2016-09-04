class List extends React.Component{
constructor(){
  super();
  this.state = {
    showChildren: false
  }
}

toggleChildren(){
  this.setState({showChildren: !this.state.showChildren})
}
  render(){

    return(
      <div className="List">
        <h3>{this.props.data.title}</h3>{this.state.showChildren ?<span onClick={this.toggleChildren.bind(this)}>A</span>:<span onClick={this.toggleChildren.bind(this)}>V</span>}
        {this.state.showChildren ?
          <div className="AllListRestaurants">
          {this.props.data.list.map((list_r, i)=>{
            return(<ListRestaurant key={i} data={list_r}/>)
          })}
          </div>
          : null
      }

      </div>
    )
  }
}
