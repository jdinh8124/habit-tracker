import React from 'react';
export default class Duration extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      duration: ''
    };
    this.updateInfo = this.updateInfo.bind(this);
    this.typingUpdate = this.typingUpdate.bind(this);
  }

  updateInfo() {
    event.preventDefault();
    this.props.addingInfo('duration', this.state.duration);
    this.props.changeView('chooseCongrats');
  }

  typingUpdate(event) {
    this.setState({
      duration: event.target.value
    });
  }

  render() {

    return (
      <>
        <div className="d-flex flex-column mt-5 align-items-center">
          <div className="input-text">How long would you like to do this for?</div>
          <form onSubmit={this.updateInfo}>
            <div className="col-12 form-group">
              <input onChange={this.typingUpdate} className="form-control" placeholder="i.e. 10 minutes"/>
            </div>
            <button onClick={this.updateInfo} type="button" className="btn btn-primary mb-4 ">Submit</button>
          </form>
        </div>
      </>
    );
  }
}
