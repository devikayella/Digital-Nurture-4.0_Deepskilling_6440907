import React from "react";

const T20Players = ["Hardik", "Rishabh"];
const RanjiPlayers = ["Pujara", "Rahane"];

// Destructure odd/even
const oddPlayers = T20Players.filter((_, i) => i % 2 !== 0);
const evenPlayers = T20Players.filter((_, i) => i % 2 === 0);

// Merge arrays using ES6 spread
const allPlayers = [...T20Players, ...RanjiPlayers];

function IndianPlayers() {
  return (
    <div>
      <h2>🇮🇳 Indian Players</h2>

      <h4>Odd Index Players</h4>
      <ul>
        {oddPlayers.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>

      <h4>Even Index Players</h4>
      <ul>
        {evenPlayers.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>

      <h4>Merged Team List</h4>
      <p>{allPlayers.join(", ")}</p>
    </div>
  );
}

export default IndianPlayers;
