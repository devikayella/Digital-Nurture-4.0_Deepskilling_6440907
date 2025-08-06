import React, { useState } from "react";

function CurrencyConvertor() {
  const [rupees, setRupees] = useState("");
  const [euros, setEuros] = useState("");

  const convertCurrency = (e) => {
    e.preventDefault(); // prevent form reload
    const euro = (parseFloat(rupees) / 88).toFixed(2);
    setEuros(euro);
  };

  return (
    <form onSubmit={convertCurrency}>
      <input
        type="number"
        value={rupees}
        onChange={(e) => setRupees(e.target.value)}
        placeholder="Enter ₹ Rupees"
        style={{ padding: "5px", marginRight: "10px" }}
      />
      <button type="submit">Convert</button>

      {euros && (
        <p style={{ marginTop: "10px" }}>
          Converted Amount: <strong>€{euros}</strong>
        </p>
      )}
    </form>
  );
}

export default CurrencyConvertor;
