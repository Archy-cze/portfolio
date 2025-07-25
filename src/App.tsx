import React from 'react';

function App() {
  return (
    <div className="app">
      <nav>
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
      </main>
    </div>
  )
}

export default App
