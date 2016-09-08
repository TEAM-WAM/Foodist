class ListRestaurant extends React.Component{
  constructor(){
    super();
    this.state = {
      showChildren: false,
      experiences: [],
      listRestaurant: ''
    }
    this.toggleVisted = this.toggleVisted.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  componentDidMount(){
    this.setState({experiences: this.props.data.experiences})
    this.setState({listRestaurant: this.props.data.list})
    if(this.state.listRestaurant.tried == null){
      this.state.listRestaurant.tried = false
    }
  }

  handleSubmit(e){
    e.preventDefault();

    var url = "/lists/"+ this.props.listId + "/list_restaurants/"+ this.props.data.list.id +"/list_experiences"
    var form = this.refs.form
    var data = {
          data: {
          date_of_experience: form.date.value,
          main_dish: form.main_dish.value,
          price: form.price.value,
          party_size: form.party_size.value,
          time_waiting: form.wait_time.value,
          notes: form.notes.value,
          list_restaurant_id: this.props.data.list.id
                      }

            }

    $.post(url, data).done((response)=> {this.setState({experiences: this.state.experiences.concat(response)})}.bind(this))

    form.reset()

  }

  toggleChildren(){
    this.setState({showChildren: !this.state.showChildren})
  }

  toggleVisted(){
    url = "/lists/" +  this.props.listId + "/list_restaurants/" + this.props.data.list.id
    $.ajax({
      url: url,
      type: 'PUT',
      data: {list_restaurant: this.state.listRestaurant,
              updating: 'tried'}
      }).done((response) => {this.setState({listRestaurant: response})}.bind(this));
  }

  render(){
    var dataId = "experiences" + this.props.dataId
    var dataIdClass = "#" + dataId
    var link = "/restaurants/" + this.props.data.restaurant.id
    return(
        <div className="row">

          <div className="row content" id="list_r_values">
          {/* iterate this for field values  */}
            <div className="col-xs-3">
              <strong><a href={link}>{this.props.data.title}</a></strong>
            </div>
            <div className="col-xs-3">
              <strong>{this.props.data.list.cuisine}</strong>
            </div>
            <div className="col-xs-3">
              <strong>{this.props.data.list.location}</strong>
            </div>
            <div className="col-xs-3">
              <strong>
                {this.state.listRestaurant.tried ?
                  <i className="glyphicon glyphicon-ok" onClick={this.toggleVisted}></i>:
                  <i className="glyphicon glyphicon-remove" onClick={this.toggleVisted}></i>
                }
              </strong>
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
              <div className="col-xs-2 fields">
                <strong>Date</strong>
              </div>
              <div className="col-xs-2 fields">
                <strong>Main Dish</strong>
              </div>
              <div className="col-xs-2 fields">
                <strong>Price</strong>
              </div>
              <div className="col-xs-2 fields">
                <strong>Party Size</strong>
              </div>
              <div className="col-xs-2 fields">
                <strong>Wait Time</strong>
              </div>
              <div className="col-xs-2 fields">
                <strong>Notes</strong>
              </div>

            </div>
            {this.state.experiences.map((list_e, i)=>{
              return(<ListExperience key={i}  data={list_e}/>)
            })}
            <div className="row">
              <form ref='form' onSubmit={this.handleSubmit.bind(this)}>
                <div className="col-xs-2 form">
                  <input type="date" name="date" />
                </div>
                <div className="col-xs-2 form">
                  <input type="text" name="main_dish" placeholder="Main Dish" />
                </div>
                <div className="col-xs-2 form">
                  <input type="text" name="price" placeholder="Price" />
                </div>
                <div className="col-xs-2 form">
                  <input type="text" name="party_size" placeholder="Party Size" />
                </div>
                <div className="col-xs-2 form">
                  <input type="text" name="wait_time" placeholder="Wait Time" />
                </div>
                <div className="col-xs-2 form">
                  <input type="text" name="notes" placeholder="Notes" />
                </div>
                <div className="row">
                </div>
                <div className="row">
                  <input type="submit" value="Add Experience" />
                </div>
              </form>
            </div>
          </div>
        </div>
    )
  }
}
