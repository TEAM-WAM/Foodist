class MyListsBox extends React.Component{
  constructor(){
    super();
    this.state = {
      myLists: [],
      showMessage: false,
      included: false

          }
    this.submitForm = this.submitForm.bind(this)
    // this.selectedList = this.selectedList.bind(this)
  }

  componentDidMount(){
    this.setState({ myLists: JSON.parse(this.props.lists)})
    this.setState({restaurant: this.props.rest})
    // var first = JSON.parse(this.props.lists)[0]
    // debugger
    // this.selectedList(first.id)
  }


  submitForm(e){
    e.preventDefault();
    data = {
      list_id: this.refs.select.value,
      restaurant_id: this.state.restaurant.id
    }
    url = "/lists/"+ this.refs.select.value + "/list_restaurants"
    $.post(url, data)
    this.toggleMessage()
  }

  toggleMessage(){
    this.setState({showMessage: !this.state.showMessage})
  }

  selectedList(selected){
    // if(!selected){
    //   selected = this.refs.select.value
    // }

    // url = "/lists/" + selected
    // data = {rest_id: this.state.restaurant.id}

    // $.ajax({url: url, data:data, method: 'put'})
    // .done((response)=> {this.setState({included: response})});
  }

  render(){
    return(
      <div>
        <form ref='form' onSubmit={this.submitForm.bind(this)} onChange={this.selectedList.bind(this)}>
            <select ref='select'>
              {this.state.myLists.map( (list, i) => {
              return(<option ref={1} key={i} value={list.id}>{list.title}</option>)
              })
            }
            </select>
            <input type="submit" value="Add" />
        </form>
           {this.state.showMessage ?
            <p><span>{this.state.restaurant.name} has been added to {this.refs.select.selectedOptions[0].text}</span></p>
           : null
      }
      </div>
      )
  }
}



