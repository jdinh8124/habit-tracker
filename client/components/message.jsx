import React from 'react';

const Message = props => {
  function handleOKClick() {
    props.changeView('');
  }

  return (
    <div className="blue-purple-gradient d-flex justify-content-center align-items-center flex-column h-100">
      <h2 className="text-white h2">{props.messageToSelf}</h2>
      <button className="btn btn-outline-light m-2 mt-5 btn-lg" onClick={handleOKClick}> OK </button>
    </div>
  );
};

export default Message;
