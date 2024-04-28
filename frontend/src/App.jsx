import { Routes, Route } from "react-router-dom";
import Home from "./pages/home.jsx";
import SignUpPage from "./pages/SignUpPage";
const App = () => {
  return (
    <main>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/SignUp" element={<SignUpPage />}></Route>
      </Routes>
    </main>
  );
};
export default App;
