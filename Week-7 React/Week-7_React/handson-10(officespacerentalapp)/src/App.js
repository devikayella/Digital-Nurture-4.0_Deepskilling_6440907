import React from "react";

const offices = [
  {
    name: "Tech Park",
    rent: 55000,
    address: "Hyderabad",
    image: "https://addressadvisors.com/templates/yootheme/cache/b7/440901714-b7797ab9.jpeg"
  },
  {
    name: "InnoSpace",
    rent: 75000,
    address: "Bangalore",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAv_UjW7kSl7vQ7O-SKcnduJExceeg8Y955w&s"
  },
  {
    name: "EcoTower",
    rent: 60000,
    address: "Pune",
    image: "https://www.prestigecityhyderabad.info/images/prestige/it-park-in-hyderabad.webp"
  }
];

function App() {
  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>🏢 Office Space Rental</h1>

      {offices.map((office, index) => (
        <div
          key={index}
          style={{
            display: "flex",
            alignItems: "center",
            border: "1px solid #ccc",
            marginBottom: "15px",
            padding: "10px",
            borderRadius: "10px",
            gap: "20px",
            backgroundColor: "#f9f9f9"
          }}
        >
          <img
            src={office.image}
            alt={office.name}
            style={{
              width: "250px",
              height: "auto",
              borderRadius: "10px"
            }}
          />

          <div>
            <h2>{office.name}</h2>
            <p>
              <strong>Rent: </strong>
              <span
                style={{
                  color: office.rent < 60000 ? "red" : "green",
                  fontWeight: "bold"
                }}
              >
                ₹{office.rent}
              </span>
            </p>
            <p>
              <strong>Address:</strong> {office.address}
            </p>
          </div>
        </div>
      ))}
    </div>
  );
}

export default App;
