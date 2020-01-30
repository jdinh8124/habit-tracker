import React from 'react';

const UserContext = React.createContext(0);

export const UserProvider = UserContext.Provider;
export const UserConsumer = UserContext.Consumer;
export default UserContext;
