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
    var dataId = "restaurants" + this.props.dataId
    var dataIdClass = "#" + dataId
    return(
    <div className="row List">
          <div className="row">
            <h2><strong>{this.props.data.title}</strong></h2>
            <a href={dataIdClass} data-toggle="collapse" onClick={this.toggleChildren.bind(this)}>
              {this.state.showChildren ?
                <i className="glyphicon glyphicon-chevron-up"></i> :
                <i className="glyphicon glyphicon-chevron-down"></i>
              }
            </a>
          </div>
      <div className="row collapse" id={dataId}>
        <div className="row">
            {/* iterate this for field headers  */}
            <div className="col-xs-3">
              <strong>Field Headers</strong>
            </div>

        </div>
        {this.props.data.restaurants.map((list_r, i)=>{
              return(<ListRestaurant key={i} dataId={i} data={list_r}/>)
            })}
      </div>
    </div>


    )
  }
}
