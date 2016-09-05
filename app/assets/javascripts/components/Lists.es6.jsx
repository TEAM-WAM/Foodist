class Lists extends React.Component{
  constructor(){
    super();
    this.state = { lists: [],
      dragging: ""
    }
this.draggingObject = this.draggingObject.bind(this)
this.dropObject = this.dropObject.bind(this)
  }

  componentDidMount(){
  fetch("http://localhost:3000/j/lists")
  .then((response)=> {return(response.json())})
  .then((jsonresponse) => {this.setState({lists: jsonresponse.lists})})
  // debugger
  // this.setState({lists: [{title: "list1",
  //                         list: [{title: "list_r1",
                                  // list: ["list_e1","list_e2","list_e3"]},
  //                                {title: "list_r2", list: ["list_e1","list_e2","list_e3"]},
  //                                {title: "list_r3", list: ["list_e1","list_e2","list_e3"]}
  //                             ]},
  //                       {title: "list2",
  //                         list: [{title: "list_r1", list: ["list_e1","list_e2","list_e3"]},
  //                                {title: "list_r2", list: ["list_e1","list_e2","list_e3"]},
  //                                {title: "list_r3", list: ["list_e1","list_e2","list_e3"]}
  //                             ]},
  //                       {title: "list3",
  //                         list: [{title: "list_r1", list: ["list_e1","list_e2","list_e3"]},
  //                                {title: "list_r2", list: ["list_e1","list_e2","list_e3"]},
  //                                {title: "list_r3", list: ["list_e1","list_e2","list_e3"]}
  //                                           ]}
  //                       ]
  //                     }
  //                   )
  }
  draggingObject(e){
    this.setState({dragging: e.target})

  }

  dropObject(e){
    this.state.lists.splice( e.target.value , 1 );
    this.setState({lists: this.state.lists})

    console.log("you dropped it")

    // debugger
  }
  dragOver(e){
      console.log("you're over")
          // console.log(e.target.value)
          // debugger
  }

  render(){
    debugger
    return(
      <div onDragOver={this.dragOver.bind(this)} className="AllLists">
        {
          this.state.lists.map((list, i) => {
            return( <List dataId={i} data={list} key={i} draggingObject={this.draggingObject} dropObject={this.dropObject} /> )
          })
        }

      </div>
    )
  }
}
