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
    this.setState({votes: this.props.vote})
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
     }.bind(this))
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
     }.bind(this))
  }

  updateVotes(newVote) {
    if(newVote) {
      this.setState({votes: newVote})
    } else {
      this.setState({votes: this.state.votes})
    }
  }


  render() {

    return(
      <div className="row-fluid" id="vote-style">
      <h4>Votes: {this.state.votes}</h4>
        <div id='Votes'>
          <a onClick={this.handleUpClick} href="" className="glyphicon glyphicon-thumbs-up"></a> <br/>
          <a onClick={this.handleDownClick} href="" className="glyphicon glyphicon-thumbs-down"></a>
        </div>
      </div>
    )
  }
}
