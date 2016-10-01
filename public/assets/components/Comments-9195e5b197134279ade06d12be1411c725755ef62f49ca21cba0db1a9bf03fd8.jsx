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
      {this.state.showComments ? <button type="button" className="btn btn-default btn-sm" id="pencil"><span className="glyphicon glyphicon-pencil" onClick={this.toggleComments}></span> </button> :<button type="button" className="btn btn-default btn-sm"><span className="glyphicon glyphicon-pencil icon-flipped" onClick={this.toggleComments}></span></button>}
      {this.state.showComments ?
        <div>
            <ul className="list-group">{
              this.state.comments.map((comment, i)=>{
                return (<Comment key={i} data={comment} votes={comment.votes} user_id={this.props.user_id} parent_id={i+1} type="Comment" />)
              }
                )
            }
            </ul>

          {this.state.showForm ?
        <form className="form-inline" id='newCommentForm' action='/comments' onSubmit={this.handleCommentSubmit.bind(this)} >
          <div className="form-group">
            <input className="form-control" ref="commentBody" name="comment[body]" placeholder="Write your comment here..." type="text" />
          </div>
          <button className="btn btn-success" type='submit'>Comment</button>
        </form>
        :
        <button className="btn btn-success" onClick={this.toggleForm}>Add Comment</button>}
        </div>: null}
      </div>

    )
  }
}
