class Comments extends React.Component {
  constructor() {
    super();
    this.state = { comments: [],
                  showForm: false
    }
    this.toggleForm = this.toggleForm.bind(this);
  }

  componentDidMount() {

      var url = "/j/"+ this.props.type.toLowerCase() + "/" + this.props.id + '/comments';
      fetch(url)
      .then((response)=> {return(response.json())})
      .then((jsonresponse) => {this.setState({comments: jsonresponse.comments})})
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


          {this.state.showForm ?
        <form id='newCommentForm' action='/comments' onSubmit={this.handleCommentSubmit.bind(this)} >
          <input ref="commentBody" name="comment[body]" placeholder="Write your comment here..." type="text" />
          <input type='submit' value="comment" />
        </form>
        : <button onClick={this.toggleForm}>Add Comment</button>}
            <ul>{
              this.state.comments.map((comment, i)=>{
                return (<Comment key={i} data={comment} />)
              }
                )
            }
            </ul>

      </div>
    )
  }
}


            // <ul>
            //   <% @comments.each do |comment| %>
            //     <li>
            //       <div>
            //         <a href= "/profiles/<%= User.find(comment.user_id).profile.id %>"><%= User.find(comment.user_id).username %></a>
            //       </div>
            //       <div>
            //         <%= comment.body %>
            //       </div>
            //     </li>
            //   <% end %>
            // </ul>
