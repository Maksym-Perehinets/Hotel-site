import "../CSS/Menu.css";
import DinnigBtn from "./ButtonsFloader/DinnigBtn";
import RoomsBtn from "./ButtonsFloader/RoomsBtn";
import BookStayBtn from "./ButtonsFloader/BookStayBtn";
import HotelCheckInOutForm from "./CheckIn";
function Header() {
  return (
    <div id="HeaderBackground">
      <div id="text">
        <h1 id="labelName">We can offer</h1>
      </div>
      <div className="Buttons">
        <DinnigBtn />
        <RoomsBtn />
        <BookStayBtn />
        <HotelCheckInOutForm />
      </div>
    </div>
  );
}

export default Header;
