import { useNavigate } from "react-router-dom";
import "../../CSS/SignUp/BackwardBtn.css";

const AccounBtn = () => {
  const navigate = useNavigate();
  const handleClick = () => navigate("/");

  return (
    <>
      <button onClick={handleClick} type="button" id="fill">
        <img src="src/assets/Backward.png" alt="Account" />
      </button>
    </>
  );
};

export default AccounBtn;
