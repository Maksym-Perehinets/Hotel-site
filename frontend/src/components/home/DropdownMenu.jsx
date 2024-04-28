import "../CSS/DropDownMenu.css";

export default function DropDownMenu() {
  return (
    <details className="dropdown">
      <summary role="button">
        <a className="button">C</a>
      </summary>
      <ul>
        <li>
          <a href="#"> a dropdown.</a>
        </li>
        <li>
          <a href="#">In Pure CSS</a>
        </li>
      </ul>
    </details>
  );
}
