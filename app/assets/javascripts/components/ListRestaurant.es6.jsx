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
    link = "/restaurants/" + this.props.data.restaurant.id
    return(
      <tr className="ListRestaurant">
        <td><strong><a href={link}>{this.props.data.title}</a></strong></td>
        <td>custom value</td><td>custom value</td><td>custom value</td>
        {this.state.showChildren ?
          <span onClick={this.toggleChildren.bind(this)} className="glyphicon glyphicon-chevron-up"></span>
          :<span onClick={this.toggleChildren.bind(this)} className="glyphicon glyphicon-chevron-down"></span>}
        {this.state.showChildren ?
          <table className="AllListExperiences table table-hover">
          <th className="col_header"> Date </th><th className="col_header"> custom fields </th><th className="col_header"> custom fields </th><th className="col_header"> custom fields </th>
          {this.props.data.experiences.map((list_e, i)=>{
            console.log(list_e)
            return(<ListExperience key={i} data={list_e}/>)
          })}
          </table>
          : null
        }
      </tr>

    )
  }
}
