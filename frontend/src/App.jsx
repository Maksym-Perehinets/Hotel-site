import { Routes, Route } from "react-router-dom";
import { Home, SignUpPage, NumberView } from "./pages";

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
