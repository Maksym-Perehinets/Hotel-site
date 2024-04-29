import { Routes, Route } from "react-router-dom";
import {Home, SignUpPage, NumberView} from "./pages";
// import SignUpPage from "./pages/SignUpPage";
// import numberViewPage from "./pages/numberViewPage.jsx";

const App = () => {
  return (
    <main>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/SignUp" element={<SignUpPage />} />
        <Route path="/NumberView" element={<NumberView />} />
      </Routes>
    </main>
  );
};
export default App;
