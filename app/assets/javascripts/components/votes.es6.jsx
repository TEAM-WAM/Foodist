class Votes extends React.Component {

  constructor() {
    super();
    this.state = {
      votes: 0
    };
    this.handleDownClick = this.handleDownClick.bind(this);
    this.handleUpClick = this.handleUpClick.bind(this);
    this.updateVotes = this.updateVotes.bind(this);
  }

  componentDidMount() {
    this.updateVotes();
  }

  handleUpClick(event) {
    event.preventDefault();
    link = $(event.target);

    data = {
      vote: {
          voteable_id: this.props.parent_id,
          voteable_type: this.props.parent_class,
          user_id: this.props.user_id,
          up: true
        }
      };

    $.post('/votes', data )
     .done((response) => {
       this.updateVotes(response);
       link.parent().hide();
     })
  }

  handleDownClick(event) {
    event.preventDefault();

    link = $(event.target)
    data = {
      vote: {
          voteable_id: this.props.parent_id,
          voteable_type: this.props.parent_class,
          user_id: this.props.user_id,
          up: false
        }
      };

    $.post('/votes', data )
     .done((response) => {
       this.updateVotes(response)
       link.parent().hide()
     })
  }

  updateVotes(newVote) {
    if(newVote) {
      vote = this.state.votes + newVote
      this.setState({votes: vote})
    } else {
      this.setState({votes: this.props.vote})
    }
  }

  render() {
    return(
      <div className="row-fluid">
      <h4>Net Votes: {this.state.votes}</h4>
        <div id='Votes'>
          <a onClick={this.handleUpClick} href="" className="glyphicon glyphicon-thumbs-up"></a> <br/>
          <a onClick={this.handleDownClick} href="" className="glyphicon glyphicon-thumbs-down"></a>
        </div>
      </div>
    )
  }
}
