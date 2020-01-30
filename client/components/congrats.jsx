import React from 'react';
export default class Congrats extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      congrats: ''
    };
    this.updateInfo = this.updateInfo.bind(this);
    this.typingUpdate = this.typingUpdate.bind(this);
  }

  updateInfo() {
    this.props.addingInfo('congratsMessage', this.state.congrats);
    this.props.changeView('chooseMotivation');
  }

  typingUpdate(event) {
    this.setState({
      congrats: event.target.value
    });
  }

  render() {

    return (
      <>
        <div className="d-flex flex-column justify-content-center h-75 align-items-center">
          <h2 className="text-center mb-3 text-secondary">What will you tell yourself everytime you complete this habit?</h2>
          <div className="form-group p-3 w-100">
            <textarea onChange={this.typingUpdate} className="form-control w-100 text-lg" rows="5"></textarea>
          </div>
          <button onClick={this.updateInfo} type="button" className="btn blue-purple-gradient text-light mb-4">Submit</button>
        </div>
      </>
    );
  }
}
