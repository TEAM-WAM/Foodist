class ListExperience extends React.Component{
  render(){
    return(
    <div className="row values ListExperience" id="listexp" draggable="true">
      {/* this section iterated per field values */}
      <div className="col-xs-2 values">
        {this.props.data.date_of_experience}
      </div>
      <div className="col-xs-2 values">
        {this.props.data.main_dish}
      </div>
      <div className="col-xs-2 values">
        {this.props.data.price}
      </div>
      <div className="col-xs-2 values">
        {this.props.data.party_size}
      </div>
      <div className="col-xs-2 values">
        {this.props.data.time_waiting}
      </div>
      <div className="col-xs-2 values">
        {this.props.data.notes}
      </div>
    </div>
    )
  }

}
