import "./CSS/App.css";
import Header from "./components/Header";
import Menu from "./components/Menu";
import "./CSS/Menu.css";
import InfoDiv from "./pages/home/infoDiv";
import { ParalaxBanner } from "./components/ParalaxBanner";
import Footer from "./components/Footer.jsx";
function App() {
  return (
    <div>
      <Header />
      <ParalaxBanner />
      <Menu />
      <h1 id="Label">HotelWeb</h1>
      <InfoDiv />
      <div id="aboba1"></div>
      <Footer />
    </div>
  );
}
export default App;
