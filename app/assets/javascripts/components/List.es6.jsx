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

            <div className="col-md-2">
              <Votes
                  vote={this.props.votes}
                  parent_id={this.props.parent_id}
                  parent_class={this.props.type}
                  user_id={this.props.user_id}/>
            </div>
            <div className="col-md-8">
              <h2><strong>{this.props.data.title}</strong></h2>
            </div>
          </div>
          <div className="row">
            <a href={dataIdClass} data-toggle="collapse" onClick={this.toggleChildren.bind(this)}>
              {this.state.showChildren ?
                <i className="glyphicon glyphicon-chevron-up"></i> :
                <i className="glyphicon glyphicon-chevron-down"></i>
              }
            </a>
          </div>
      <div className="row collapse" id={dataId}>
        <div className="row" id="list_r_heads">
            {/* iterate this for field headers  */}
            <div className="col-xs-3">
              <strong>Restaurant</strong>
            </div>
             <div className="col-xs-3">
              <strong>Cuisine</strong>
            </div>
             <div className="col-xs-3">
              <strong>Location</strong>
            </div>
             <div className="col-xs-3">
              <strong>Visted</strong>
            </div>

        </div>
        {this.props.data.restaurants.map((list_r, i)=>{
              return(<ListRestaurant listId={this.props.data.list.id} key={i} dataId={i} data={list_r}/>)
            })}
      </div>
    </div>
    )
  }
}
