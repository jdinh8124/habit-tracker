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
        <div className="d-flex flex-column justify-content-center h-75 align-items-center">
          <div className="p-3">
            <h2 className="text-center text-secondary">How long would you like to do this for?</h2>
          </div>
          <form className="d-flex flex-column justify-content-center align-items-center" onSubmit={this.updateInfo}>
            <input onChange={this.typingUpdate} className="form-control" placeholder="i.e. 10 mins"/>
            <button onClick={this.updateInfo} type="button" className="btn blue-purple-gradient text-light mt-4 ">Submit</button>
          </form>
        </div>
      </>
    );
  }
}
