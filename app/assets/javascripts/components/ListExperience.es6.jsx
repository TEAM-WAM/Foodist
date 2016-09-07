class ListExperience extends React.Component{
  render(){
    return(
    <div className="row values ListExperience" draggable="true">
      {/* this section iterated per fiel values */}
      <div className="col-xs-3 values">
        {this.props.data.date_of_experience}
      </div>

    </div>
    )
  }

}
