import { useState } from 'react';
import fillerImage from './assets/filler.webp'; // Importing a filler image for potential use

function App() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <div className="app">
      <button className="hamburger" onClick={toggleMenu} aria-label="Toggle menu">
        <span className={`hamburger-line ${isMenuOpen ? 'open' : ''}`}></span>
        <span className={`hamburger-line ${isMenuOpen ? 'open' : ''}`}></span>
        <span className={`hamburger-line ${isMenuOpen ? 'open' : ''}`}></span>
      </button>
      
      <nav className={`nav ${isMenuOpen ? 'nav-open' : ''}`}>
        <p className="active">HOME</p>
        <p>ABOUT</p>
        <p>PROJECTS</p>
        <p>CONTACT</p>
      </nav>
      
      <main>
        <div className="home">
          <h1>Welcome to My Portfolio</h1><br />

          <p>This is a showcase of my work and skills. My name is <span className="underline">Arkadusz</span>, and I passionately love web development and UI/UX design. <br /><br />
            My main stream of interest are websites with responsive design. As a person who worked in few different fields,
            I know what people need to visit your website and bring more valuable contracts.</p>
        </div>
        <div className="home-image">
          <img src={fillerImage} alt="Home" />
        </div>
      </main>
    </div>
  )
}

export default App
