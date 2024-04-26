import { useState } from "react";

function HotelCheckInOutForm() {
  const [rooms, setRooms] = useState("");
  const [adults, setAdults] = useState(1);
  const [children, setChildren] = useState(0);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle form submission logic here
  };

  const handleRoomsChange = (e) => {
    const newRooms = parseInt(e.target.value);
    if (isNaN(newRooms) || newRooms < 1) {
      alert("Please enter a valid number of rooms.");
      return;
    }

    setRooms(newRooms);
    const maxCounts = newRooms * 7;
    setAdults(Math.min(adults, maxCounts));
    setChildren(Math.min(children, maxCounts));
  };

  return (
    <div>
      <h2>Hotel Check-in/Check-out Form</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="checkin">Check-in Date:</label>
        <input type="date" id="checkin" name="checkin" required />

        <label htmlFor="checkout">Check-out Date:</label>
        <input type="date" id="checkout" name="checkout" required />

        <label htmlFor="rooms">Number of Rooms:</label>
        <input
          type="number"
          id="rooms"
          name="rooms"
          min="1"
          value={rooms}
          onChange={handleRoomsChange}
          required
        />

        <label htmlFor="adults">Number of Adults:</label>
        <input
          type="number"
          id="adults"
          name="adults"
          min="1"
          max={rooms * 7}
          value={adults}
          onChange={(e) => setAdults(e.target.value)}
          required
        />

        <label htmlFor="children">Number of Children:</label>
        <input
          type="number"
          id="children"
          name="children"
          min="0"
          max={rooms * 7}
          value={children}
          onChange={(e) => setChildren(e.target.value)}
          required
        />

        <input type="submit" value="Submit" />
      </form>
    </div>
  );
}

export default HotelCheckInOutForm;
