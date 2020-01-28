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
      <div className=" ">
        <div className="d-flex flex-column mt-5 align-items-center ">
          <div className="input-text">How often would you like to do this habit?</div>
          <button onClick={this.updateInfoDaily} text="Daily" type="button" className="btn btn-primary mb-4 ">Daily</button>
          <button onClick={this.updateInfoWeekly} type="button" className="btn btn-primary mb-4 ">Weekly</button>
          <button onClick={this.updateInfoMonthly} type="button" className="btn btn-primary mb-4  ">Monthly</button>
        </div>
      </div>
    );
  }

}
