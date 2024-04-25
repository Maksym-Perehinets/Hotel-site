import { useState, useEffect } from "react";
import "../CSS/ParalaxBanner.css";

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
        backgroundSize: `${(window.outerHeight - scrollPosition) / 3}%`,
      }}
      className="banner container"
    >
      <h2>{name}</h2>
      {/* <button>Get Started</button> */}
    </section>
  );
};
