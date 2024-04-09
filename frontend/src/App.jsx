import { useState } from 'react'
import reactLogo from './assets/react.svg'
import './App.css'
import NavBar from './navbar'
import './navbar.css'
import Home from './home.jsx'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <NavBar />
      <Home/>
      

    </>
  )
}

export default App
