import React from 'react';
export default class Motivation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      motivation: ''
    };
    this.updateInfo = this.updateInfo.bind(this);
    this.typingUpdate = this.typingUpdate.bind(this);
  }

  updateInfo() {
    event.preventDefault();
    this.props.addingInfo('motivationalMessage', this.state.motivation);
    this.props.changeView('back');
  }

  typingUpdate(event) {
    this.setState({
      motivation: event.target.value
    });
  }

  render() {

    return (
      <>
        <div className="d-flex flex-column justify-content-center h-75 align-items-center">
          <h2 className="text-center mb-3 text-secondary">What will you tell yourself if you need some extra motivation?</h2>
          <div className="form-group p-3 w-100">
            <textarea onChange={this.typingUpdate} className="form-control w-100" rows="10"></textarea>
          </div>
          <button onClick={this.updateInfo} type="button" className="btn blue-purple-gradient text-light mb-4 ">Submit</button>
        </div>
      </>
    );
  }
}
