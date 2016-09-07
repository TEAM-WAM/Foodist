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
      <tr className="List">
        <h2><strong>{this.props.data.title}</strong></h2>{this.state.showChildren ?
          <span onClick={this.toggleChildren.bind(this)} className="glyphicon glyphicon-chevron-up">
          </span>:
          <span onClick={this.toggleChildren.bind(this)} className="glyphicon glyphicon-chevron-down">
          </span>}
        {this.state.showChildren ?
          <table className="AllListRestaurants table table-bordered">
          <th className="col_header"> Restaurant </th><th className="col_header"> custom fields </th><th className="col_header"> custom fields </th><th className="col_header"> custom fields </th>
          {this.props.data.restaurants.map((list_r, i)=>{
            return(<ListRestaurant key={i} data={list_r}/>)
          })}
          </table>
          : null
      }

      </tr>
    )
  }
}
