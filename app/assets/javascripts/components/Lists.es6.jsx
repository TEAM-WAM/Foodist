class Lists extends React.Component{
  constructor(){
    super();
    this.state = {
      lists: []
    }
  }

  componentDidMount(){
  // fetch("/lists")
  // .then((response)=> response.json())
  // .then((jsonresponse) => this.setState({lists: jsonresponse}))
  this.setState({lists: [{title: "list1",
                          list: [{title: "list_r1", list: ["list_e1","list_e2","list_e3"]},
                                 {title: "list_r2", list: ["list_e1","list_e2","list_e3"]},
                                 {title: "list_r3", list: ["list_e1","list_e2","list_e3"]}
                              ]},
                        {title: "list2",
                          list: [{title: "list_r1", list: ["list_e1","list_e2","list_e3"]},
                                 {title: "list_r2", list: ["list_e1","list_e2","list_e3"]},
                                 {title: "list_r3", list: ["list_e1","list_e2","list_e3"]}
                              ]},
                        {title: "list3",
                          list: [{title: "list_r1", list: ["list_e1","list_e2","list_e3"]},
                                 {title: "list_r2", list: ["list_e1","list_e2","list_e3"]},
                                 {title: "list_r3", list: ["list_e1","list_e2","list_e3"]}
                                            ]}
                        ]
                      }
                    )
  }

  render(){

    return(
      <div className="AllLists">
        {
          this.state.lists.map((list, i) => {
            return( <List data={list} key={i} /> )
          })
        }

      </div>
    )
  }
}
