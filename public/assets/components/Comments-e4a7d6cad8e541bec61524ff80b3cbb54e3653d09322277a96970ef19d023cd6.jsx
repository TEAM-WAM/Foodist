class Comments extends React.Component {
  constructor() {
    super();
    this.state = { comments: [],
                  showForm: false,
                  showComments: true
    }
    this.toggleForm = this.toggleForm.bind(this);
    this.toggleComments = this.toggleComments.bind(this);
  }

  componentDidMount() {

      var url = "/j/"+ this.props.type.toLowerCase() + "/" + this.props.id + '/comments';
      fetch(url)
      .then((response)=> {return(response.json())})
      .then((jsonresponse) => {this.setState({comments: jsonresponse.comments})})
      }

  toggleComments(){
    this.setState({showComments: !(this.state.showComments)})
  }

  toggleForm(){
    this.setState({showForm: !(this.state.showForm)})
  }

  handleCommentSubmit(e){
    e.preventDefault();
    this.toggleForm();
    data = {body: this.refs.commentBody.value,
            commentable_id: this.props.id,
            commentable_type: this.props.type}

    $.post('/comments', data).done((response) => {
      this.setState({comments: this.state.comments.concat(response.comments)})
    })
  }

  render() {

    return (

      <div>
      {this.state.showComments ? <button type="button" className="btn btn-default btn-sm"><span className="glyphicon glyphicon-pencil" onClick={this.toggleComments}></span> </button> :<button type="button" className="btn btn-default btn-sm"><span className="glyphicon glyphicon-pencil icon-flipped" onClick={this.toggleComments}></span></button>}
      {this.state.showComments ?
      <div>
            <ul className="list-group">{
              this.state.comments.map((comment, i)=>{
                return (<Comment key={i} data={comment} />)
              }
                )
            }
            </ul>


          {this.state.showForm ?
        <form id='newCommentForm' action='/comments' onSubmit={this.handleCommentSubmit.bind(this)} >
          <input ref="commentBody" name="comment[body]" placeholder="Write your comment here..." type="text" />
          <input type='submit' value="comment" />
        </form>
        : <button onClick={this.toggleForm}>Add Comment</button>}
        </div>: null}
      </div>
    )
  }
}
