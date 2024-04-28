import { useNavigate } from "react-router-dom";
import "../../CSS/AccountBtn.css";
// import { Link } from "react-router-dom";
// import SignUp from "../../pages/SignUp";
const AccounBtn = () => {
  const navigate = useNavigate();
  const handleClick = () => navigate("/SignUp");

  return (
    <>
      <button onClick={handleClick} type="button" id="fill">
        <img src="src\assets\accountIco.png" alt="Account" />
      </button>
    </>
  );
};

export default AccounBtn;
