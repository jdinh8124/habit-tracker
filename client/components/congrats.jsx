import React from 'react';
import Header from './header';
import { Link } from 'react-router-dom';
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
  }

  typingUpdate(event) {
    this.setState({
      congrats: event.target.value
    });
  }

  render() {

    return (
      <>
        <Header headerView="subMain" />
        <div className="d-flex flex-column mt-5 align-items-center">
          <div className="input-text">What will you tell yourself everytime you complete this habit?</div>
          <div className="col-12 form-group">
            <textarea onChange={this.typingUpdate} className="form-control" rows="10"></textarea>
          </div>
          <Link to="/motivation">
            <button onClick={this.updateInfo} type="button" className="btn btn-primary mb-4 ">Submit</button>
          </Link>
        </div>
      </>
    );
  }
}
