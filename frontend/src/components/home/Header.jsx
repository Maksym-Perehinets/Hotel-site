import "../../CSS/Header.css";
import AccounBtn from "../ButtonsFloader/AccountBtn";
// import DropDownMenu from "./DropdownMenu";
const Header = () => {
  return (
    <div>
      <header>
        <div id="AcoountDiv">
          <AccounBtn />
          {/* <DropDownMenu /> */}
        </div>
        <h1>Dnipro Vista Hotel</h1>
      </header>
    </div>
  );
};

export default Header;
