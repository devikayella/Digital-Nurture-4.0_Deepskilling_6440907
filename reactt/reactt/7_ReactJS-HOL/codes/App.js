import React, { useState } from "react";
import GuestPage from "./GuestPage";
import UserPage from "./UserPage";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLoginLogout = () => {
    setIsLoggedIn(!isLoggedIn);
  };

  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>Flight Ticket Booking</h1>
      
      <button onClick={handleLoginLogout}>
        {isLoggedIn ? "Logout" : "Login"}
      </button>

      <div style={{ marginTop: "30px" }}>
        {isLoggedIn ? <UserPage /> : <GuestPage />}
      </div>
    </div>
  );
}

export default App;
