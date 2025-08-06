import React, { useState } from "react";
import CurrencyConvertor from "./CurrencyConvertor";

function App() {
  const [count, setCount] = useState(0);

  const increment = () => {
    setCount(prev => prev + 1);
    sayHello(); // multiple functions in one event
  };

  const decrement = () => {
    setCount(prev => prev - 1);
  };

  const sayHello = () => {
    alert("Hello! This is an extra action.");
  };

  const sayWelcome = (message) => {
    alert("Message: " + message);
  };

  const handleClick = (e) => {
    alert("I was clicked!");
    console.log("SyntheticEvent:", e);
  };

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>🎯 React Events Lab</h1>

      <h2>Counter</h2>
      <p>Count: {count}</p>
      <button onClick={increment}>Increment</button>
      <button onClick={decrement}>Decrement</button>

      <h2>Pass Argument to Event</h2>
      <button onClick={() => sayWelcome("Welcome to React!")}>
        Say Welcome
      </button>

      <h2>Synthetic Event</h2>
      <button onClick={handleClick}>Synthetic Event (onClick)</button>

      <h2>Currency Convertor</h2>
      <CurrencyConvertor />
    </div>
  );
}

export default App;
