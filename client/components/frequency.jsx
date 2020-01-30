import React from 'react';

export default class Frequnecy extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      frequncy: null
    };
    this.updateInfoDaily = this.updateInfoDaily.bind(this);
    this.updateInfoWeekly = this.updateInfoWeekly.bind(this);
    this.updateInfoMonthly = this.updateInfoMonthly.bind(this);
  }

  updateInfoDaily() {
    this.props.addingInfo('frequency', 1);
    this.props.changeView('chooseDuration');
  }

  updateInfoWeekly(event) {
    this.props.addingInfo('frequency', 7);
    this.props.changeView('chooseDuration');
  }

  updateInfoMonthly(event) {
    this.props.addingInfo('frequency', 30);
    this.props.changeView('chooseDuration');
  }

  render() {
    return (

      <div className="d-flex flex-column justify-content-center h-75 align-items-center ">
        <div className = "p-3">
          <h2 className="text-center text-secondary">How often would you like to do this habit?</h2>
        </div>
        <button onClick={this.updateInfoDaily} text="Daily" type="button" className="btn blue-purple-gradient text-light mb-4 ">Daily</button>
        <button onClick={this.updateInfoWeekly} type="button" className="btn blue-purple-gradient text-light mb-4 ">Weekly</button>
        <button onClick={this.updateInfoMonthly} type="button" className="btn blue-purple-gradient text-light mb-4  ">Monthly</button>
      </div>);
  }

}
