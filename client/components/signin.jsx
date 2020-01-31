import React from 'react';

class SignIn extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userName: '',
      userPwd: '',
      wrongUsername: false,
      emptyFields: false

    };
    this.userNameChange = this.userNameChange.bind(this);
    this.passwordChange = this.passwordChange.bind(this);
    this.checkAccount = this.checkAccount.bind(this);
  }

  userNameChange(event) {
    this.setState({ userName: event.target.value });

  }

  passwordChange(event) {
    this.setState({ userPwd: event.target.value });
  }

  isUserNameValid() {
    if (this.state.wrongUsername) {
      return (
        <div className="invalid-feedback showError">
          Your Username or Password Was Incorrect
        </div>
      );
    }
  }

  isUserFieldsEmpty() {
    if (this.state.emptyFields) {
      return (
        <div className="invalid-feedback showError mb-3 warningDiv">
          You Have Empty Fields
        </div>
      );
    }
  }

  checkAccount() {
    event.preventDefault();
    if (this.state.userPwd === '' || this.state.userName === '') {
      this.setState(previousState => ({ emptyFields: true }));
      return;
    } else {
      this.setState(previousState => ({ emptyFields: false }));
    }

    const newObj = { ...this.state };
    event.preventDefault();
    fetch('/api/auth/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(newObj)
    })
      .then(response => {
        if (response.status === 200) return response.json();
        else this.setState(previousState => ({ wrongUsername: true }));
      })
      .then(res => {
        if (res) {
          sessionStorage.setItem('id', res);
          this.props.setUserId();
          this.props.history.push('/userHabits');
        }

      });
  }

  render() {
    return (
      <div className="d-flex flex-column  align-items-center h-100vh justify-content-center">
        <h1 className="purple-font">Sign In</h1>
        <form className="d-flex align-items-center flex-column" onSubmit={this.checkAccount}>
          {this.isUserNameValid()}
          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-user"></i></span>
            </div>
            <input onChange={this.userNameChange} className="form-control" placeholder="Username" />
          </div>
          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-lock"></i></span>
            </div>
            <input type="password" name="password" autoComplete="on" onChange={this.passwordChange} className="form-control" placeholder="Password" />
          </div>
          {this.isUserFieldsEmpty()}
          <button className="btn text-light blue-purple-gradient">Sign In</button>
        </form>
      </div>
    );
  }
}

export default SignIn;
