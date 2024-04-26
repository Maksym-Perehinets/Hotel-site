import { useState, useEffect } from "react";
import "../CSS/ParalaxBanner.css";
// import ImageSwap from "./imageChange";

// eslint-disable-next-line react/prop-types
export const ParalaxBanner = ({ name }) => {
  const [scrollPosition, setScrollPosition] = useState(0);

  const handleScroll = () => setScrollPosition(window.scrollY);

  useEffect(() => {
    window.addEventListener("scroll", handleScroll, { passive: true });

    return () => window.removeEventListener("scroll", handleScroll);
  }, []);
  return (
    <section
      style={{
        backgroundSize: `${(window.outerHeight + scrollPosition) / 10}%`,
      }}
      className="banner container"
    ></section>
  );
};
