import { Routes, Route } from "react-router-dom";
import { Home, SignUpPage } from "./pages";

const App = () => {
  return (
    <main>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/SignUp" element={<SignUpPage />} />
      </Routes>
    </main>
  );
};
export default App;
