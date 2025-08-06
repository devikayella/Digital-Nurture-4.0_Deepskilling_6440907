import React, { useState } from "react";
import UserPage from "./UserPage";
import GuestPage from "./GuestPage";

function App() {
  const [loggedIn, setLoggedIn] = useState(false);

  const toggleLogin = () => {
    setLoggedIn(!loggedIn);
  };

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>🛫 Ticket Booking App</h1>

      <button onClick={toggleLogin}>
        {loggedIn ? "Logout" : "Login"}
      </button>

      <hr />

      {loggedIn ? <UserPage /> : <GuestPage />}
    </div>
  );
}

export default App;
