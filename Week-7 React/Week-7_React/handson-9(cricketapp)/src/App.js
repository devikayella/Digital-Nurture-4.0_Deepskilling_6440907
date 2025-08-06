import React, { useState } from "react";
import ListOfPlayers from "./ListOfPlayers";
import IndianPlayers from "./IndianPlayers";

function App() {
  const [flag, setFlag] = useState(true);

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>🏏 Cricket App</h1>

      <button onClick={() => setFlag(!flag)}>
        Toggle View ({flag ? "High Scorers" : "Indian Players"})
      </button>

      <hr />

      {flag ? <ListOfPlayers /> : <IndianPlayers />}
    </div>
  );
}

export default App;
