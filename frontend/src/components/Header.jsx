import "../CSS/Header.css";
import AccounBtn from "./ButtonsFloader/AccountBtn";
const Header = () => {
  return (
    <div>
      <header>
        <div>
          <AccounBtn />
        </div>
        <h1>Hotel Reservation</h1>
      </header>
    </div>
  );
};

export default Header;
