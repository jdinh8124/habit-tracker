import React from 'react';
import Header from './header';
import { Link } from 'react-router-dom';
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
  }

  updateInfoWeekly(event) {
    this.props.addingInfo('frequency', 7);
  }

  updateInfoMonthly(event) {
    this.props.addingInfo('frequency', 30);
  }

  render() {
    return (
      <div className=" ">
        <Header headerView="subMain" />
        <div className="d-flex flex-column mt-5 align-items-center ">
          <div className="input-text">How often would you like to do this habit?</div>
          <Link to="/duration">
            <button onClick={this.updateInfoDaily} text="Daily" type="button" className="btn btn-primary mb-4 ">Daily</button>
            <button onClick={this.updateInfoWeekly} type="button" className="btn btn-primary mb-4 ">Weekly</button>
            <button onClick={this.updateInfoMonthly} type="button" className="btn btn-primary mb-4  ">Monthly</button>
          </Link>
        </div>
      </div>
    );
  }

}
