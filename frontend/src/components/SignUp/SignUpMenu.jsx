import "../../CSS/SignUp/SignUp.scss";

function SignUpMenu() {
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
    </div>
  );
}

export default SignUpMenu;
