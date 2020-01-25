import React from 'react';

class SignIn extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userName: '',
      userPwd: ''
    };
    this.userNameChange = this.userNameChange.bind(this);
    this.passwordChange = this.passwordChange.bind(this);
  }

  userNameChange(event) {
    this.setState({ userName: event.target.value });

  }

  passwordChange(event) {
    this.setState({ userPwd: event.target.value });
  }

  checkAccount() {
    fetch('/auth/login')
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        // console.log(myJson);
      });
  }

  render() {
    return (
      <div className="d-flex flex-column mt-5 align-items-center">
        <h1>Create Account</h1>
        <form onSubmit={this.checkAccount}>
          <input className="form-control" placeholder="Username" />
          <input className="form-control" placeholder="Password" />
          <button className="btn btn-primary mb-4">Sign In</button>
        </form>
      </div>
    );
  }
}
export default SignIn;
