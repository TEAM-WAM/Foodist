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
    var dataId = "experiences" + this.props.dataId
    var dataIdClass = "#" + dataId
    var link = "/restaurants/" + this.props.data.restaurant.id
    return(
        <div className="row" draggable="true">

          <div className="row content">
          {/* iterate this for field values  */}
            <div className="col-xs-3">
              <strong><a href={link}>{this.props.data.title}</a></strong>
            </div>

          </div>

          <a href={dataIdClass} data-toggle="collapse" onClick={this.toggleChildren.bind(this)}>
            {this.state.showChildren ?
              <i className="glyphicon glyphicon-chevron-up"></i>:
              <i className="glyphicon glyphicon-chevron-down"></i>
            }
          </a>

          <div className="row collapse" id={dataId}>
            <div className="row headers">
            {/* iterate over all col feilds with the fields className */}
              <div className="col-xs-3 fields">
                <strong>Fieldname</strong>
              </div>

            </div>
            {this.props.data.experiences.map((list_e, i)=>{
              return(<ListExperience key={i}  data={list_e}/>)
            })}
          </div>
        </div>
    )
  }
}
