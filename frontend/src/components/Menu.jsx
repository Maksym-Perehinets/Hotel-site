import "../CSS/Menu.css";
import DinnigBtn from "./ButtonsFloader/DinnigBtn";
import RoomsBtn from "./ButtonsFloader/RoomsBtn";
import BookStayBtn from "./ButtonsFloader/BookStayBtn";
function Header() {
  return (
    <div id="HeaderBackground">
      <div id="text">
        <h1 id="labelName">Around The World</h1>
      </div>
      <div className="Buttons">
        <DinnigBtn />
        <RoomsBtn />
        <BookStayBtn />
      </div>
    </div>
  );
}

export default Header;
