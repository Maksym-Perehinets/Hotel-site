import { useEffect } from "react";
import "../../CSS/SignUp/SignUp.scss";

function SignUpMenu() {
  useEffect(() => {
    const myInput = document.getElementById("psw");
    const letter = document.getElementById("letter");
    const capital = document.getElementById("capital");
    const number = document.getElementById("number");
    const length = document.getElementById("length");

    // When the user clicks on the password field, show the message box
    myInput.addEventListener("focus", () => {
      document.getElementById("message").style.display = "block";
    });

    // When the user clicks outside of the password field, hide the message box
    myInput.addEventListener("blur", () => {
      document.getElementById("message").style.display = "none";
    });

    // When the user starts to type something inside the password field
    myInput.addEventListener("keyup", () => {
      // Validate lowercase letters
      const lowerCaseLetters = /[a-z]/g;
      if (myInput.value.match(lowerCaseLetters)) {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
      } else {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
      }

      // Validate capital letters
      const upperCaseLetters = /[A-Z]/g;
      if (myInput.value.match(upperCaseLetters)) {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
      } else {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
      }

      // Validate numbers
      const numbers = /[0-9]/g;
      if (myInput.value.match(numbers)) {
        number.classList.remove("invalid");
        number.classList.add("valid");
      } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
      }

      // Validate length
      if (myInput.value.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
      } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
      }
    });
  }, []);

  return (
    <div className="aboba">
      <div className="main">
        <input type="checkbox" id="chk" aria-hidden="true" />

        <div className="signup">
          <form>
            <label className="signuplabel" htmlFor="chk" aria-hidden="true">
              Sign up
            </label>

            <input type="text" name="name" placeholder="Name" required />
            <input
              type="text"
              name="secname"
              placeholder="Second Name"
              required
            />
            <input
              type="tel"
              name="phone"
              placeholder="Phone Number"
              required
            />
            <input type="email" name="email" placeholder="Email" required />
            <input
              type="password"
              id="psw"
              name="pswd"
              placeholder="Password"
              required
            />
            <button>Sign up</button>
          </form>
        </div>

        <div className="login">
          <form id="loginForm">
            <label htmlFor="chk" aria-hidden="true">
              Login
            </label>
            <input type="email" name="email" placeholder="Email" required />
            <input
              type="tel"
              name="phone"
              placeholder="Phone Number"
              required
            />
            <input
              type="password"
              name="pswd"
              placeholder="Password"
              required
            />
            <button>Login</button>
          </form>
        </div>
      </div>

      {/* Message section */}
      <div id="message">
        <h3>Password must contain the following:</h3>
        <h3>
          <b>(Use only Latin letters!)</b>
        </h3>
        <p id="letter" className="invalid">
          A <b>lowercase</b> letter
        </p>
        <p id="capital" className="invalid">
          A <b>capital (uppercase)</b> letter
        </p>
        <p id="number" className="invalid">
          A <b>number</b>
        </p>
        <p id="length" className="invalid">
          Minimum <b>8 characters</b>
        </p>
      </div>
    </div>
  );
}

export default SignUpMenu;
