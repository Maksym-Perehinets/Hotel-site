import Header from "../components/home/Header";
import { ParalaxBanner } from "../components/home/ParalaxBanner.jsx";
import Menu from "../components/home/Menu.jsx";
import HotelCheckInOutForm from "../components/home/CheckIn.jsx";
import InfoDiv from "../components/home/infoDiv.jsx";
import Footer from "../components/home/Footer.jsx";
import MainDiv from "../components/numberView/MainDiv.jsx";

function Home() {
  return (
    <>
      <Header />
      <ParalaxBanner />
      <Menu />
      <HotelCheckInOutForm />
      <MainDiv />
      <InfoDiv />
      <Footer />
    </>
  );
}
export default Home;
