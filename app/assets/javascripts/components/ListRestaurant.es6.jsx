class ListRestaurant extends React.Component{
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
      <div className="ListRestaurant">
        <h3>{this.props.data.title}</h3>{this.state.showChildren ?<span onClick={this.toggleChildren.bind(this)}>A</span>:<span onClick={this.toggleChildren.bind(this)}>V</span>}
        {this.state.showChildren ?
          <div className="AllListExperiences">
          {this.props.data.list.map((list_e, i)=>{
            console.log(list_e)
            return(<ListExperience key={i} data={list_e}/>)
          })}
          </div>
          : null
        }
      </div>

    )
  }
}
