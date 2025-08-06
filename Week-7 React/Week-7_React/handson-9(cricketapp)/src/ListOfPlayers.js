import React from "react";

const players = [
  { name: "Virat Kohli", score: 95 },
  { name: "Rohit Sharma", score: 65 },
  { name: "KL Rahul", score: 45 },
  { name: "Shubman Gill", score: 82 },
  { name: "Jadeja", score: 88 }
];

const highScorers = players.filter(p => p.score >= 70); // arrow function

function ListOfPlayers() {
  return (
    <div>
      <h2>🏏 List of High-Scoring Players (70+)</h2>
      <ul>
        {highScorers.map((player, index) => (
          <li key={index}>
            {player.name} - {player.score} runs
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ListOfPlayers;
