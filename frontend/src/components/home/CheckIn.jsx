import { useState } from "react";
import "../../CSS/CheckInOut.scss";
import { FaChild, FaPerson, FaHouse } from "react-icons/fa6";

function HotelCheckInOutForm() {
  const [rooms, setRooms] = useState("");
  const [adults, setAdults] = useState(1);
  const [children, setChildren] = useState(0);

  const handleSubmit = (e) => {
    e.preventDefault();
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
    <div id="formDiv">
      <div>
        <h1 id="Label">Book Your reservation</h1>
      </div>
      <form onSubmit={handleSubmit}>
        <div id="Inputs">
          <label htmlFor="checkin">Check-in:</label>
          <input type="date" id="checkin" name="checkin" required />
          <label htmlFor="checkout">Check-out:</label>
          <input type="date" id="checkout" name="checkout" required />
          <label htmlFor="rooms">
            Rooms-
            <FaHouse /> :
          </label>
          <input
            type="number"
            id="rooms"
            name="rooms"
            min="1"
            value={rooms}
            onChange={handleRoomsChange}
            required
          />
          <label htmlFor="adults">
            Adults-
            <FaPerson /> :
          </label>
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
          <label htmlFor="children">
            Children-
            <FaChild /> :
          </label>
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
        </div>

        <div id="SubmitDiv">
          <input type="submit" value="SUBMIT" />
        </div>
      </form>
    </div>
  );
}

export default HotelCheckInOutForm;
