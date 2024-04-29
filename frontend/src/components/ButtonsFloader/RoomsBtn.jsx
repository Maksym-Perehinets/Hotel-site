import "../../CSS/Button.css";
import { useNavigate } from 'react-router-dom'
const RoomsBtn = () => {
  const navigate = useNavigate();
  const handleClick = () => navigate("/NumberView");
  return (
    <>
      <button onClick={handleClick}>
        <span>Rooms</span>
        <svg
          viewBox="-5 -5 110 110"
          preserveAspectRatio="none"
          aria-hidden="true"
        >
          <path d="M0,0 C0,0 100,0 100,0 C100,0 100,100 100,100 C100,100 0,100 0,100 C0,100 0,0 0,0" />
        </svg>
      </button>
    </>
  );
};

export default RoomsBtn;
