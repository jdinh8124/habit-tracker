import React from 'react';

class SignUp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userName: '',
      email: '',
      userPwd: '',
      confirmPassword: '',
      duplicateUsername: false,
      passwordsDoNotMatch: false,
      emailError: false,
      emptyFields: false

    };
    this.userNameChange = this.userNameChange.bind(this);
    this.emailChange = this.emailChange.bind(this);
    this.passwordChange = this.passwordChange.bind(this);
    this.confirmPasswordChange = this.confirmPasswordChange.bind(this);
    this.createAccount = this.createAccount.bind(this);
  }

  userNameChange(event) {
    this.setState({ userName: event.target.value });
  }

  emailChange(event) {
    this.setState({ email: event.target.value });

  }

  passwordChange(event) {
    this.setState({ userPwd: event.target.value });

  }

  confirmPasswordChange(event) {
    this.setState({ confirmPassword: event.target.value });

  }

  createAccount() {
    event.preventDefault();
    if (this.state.userPwd === '' || this.state.confirmPassword === '' || this.state.userName === '' || this.state.email === '') {
      this.setState(previousState => ({ emptyFields: true }));
      return;
    } else {
      this.setState(previousState => ({ emptyFields: false }));

    }
    if (this.state.userPwd !== this.state.confirmPassword) {
      this.setState(previousState => ({ passwordsDoNotMatch: true }));
      return;
    } else {
      this.setState(previousState => ({ passwordsDoNotMatch: false }));
    }
    var re = /\S+@\S+\.\S+/;
    if (!re.test(this.state.email)) {
      this.setState(previousState => ({ emailError: true }));
      return;
    } else {
      this.setState(previousState => ({ emailError: false }));
    }

    const newObj = { ...this.state };
    fetch('/api/auth/signup', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(newObj)
    })
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        if (myJson === 'Username exists' || myJson.error === 'an unexpected error occurred') {
          this.setState(previousState => ({ duplicateUsername: true }));
        } else {
          this.props.signIn();
        }
      });
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

  isUserNameValid() {
    if (this.state.duplicateUsername) {
      return (
        <div className="invalid-feedback showError mb-3 warningDiv">
          Your Username You Selected Was Taken
        </div>
      );
    }
  }

  passWordsDoNotMatch() {
    if (this.state.passwordsDoNotMatch) {
      return (
        <div className="invalid-feedback showError mb-3 warningDiv">
          Your Passwords Do Not Match
        </div>
      );
    }
  }

  isThereAnEmailError() {
    if (this.state.emailError) {
      return (
        <div className="invalid-feedback showError mb-3 warningDiv">
          Your Email Was Not Valid
        </div>
      );
    }
  }

  render() {
    return (
      <div className="d-flex flex-column  align-items-center h-100vh justify-content-center ">
        <h1 className="purple-font">Create Account</h1>
        <form className="d-flex align-items-center flex-column" onSubmit={this.createAccount}>
          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-user"></i></span>
            </div>
            <input onChange={this.userNameChange} className="form-control" placeholder="Username" />
          </div>

          {this.isUserNameValid()}
          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-envelope"></i></span>
            </div>
            <input onChange={this.emailChange} className="form-control" placeholder="Email" />
          </div>
          {this.isThereAnEmailError()}
          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-lock"></i></span>
            </div>
            <input type="password" name="password" autoComplete="on" onChange={this.passwordChange} className="form-control" placeholder="Password" />
          </div>

          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-lock"></i></span>
            </div>
            <input type="password" name="password" autoComplete="on" onChange={this.confirmPasswordChange} className="form-control" placeholder="Confirm Password" />
          </div>
          {this.passWordsDoNotMatch()}
          {this.isUserFieldsEmpty()}

          <button className="btn text-light blue-purple-gradient">Submit</button>
        </form>
      </div>
    );
  }
}

export default SignUp;
