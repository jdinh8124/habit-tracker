import React from 'react';

const Footer = props => {
  return (
    <div className="container">
      <div className="row">
        <div className="col-10"></div>
        <div className="col-2">
          <button><i className="fas fa-plus-circle" onClick={
            () => props.setBlank(true)
          }></i></button>
        </div>
      </div>
    </div>
  );
};

export default Footer;
