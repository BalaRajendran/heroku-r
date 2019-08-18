import React, { Component } from "react";
import axios from "axios";
class App extends Component {
  componentDidMount() {
    fetch(`http://localhost:8000/`).then(result => {
      console.log(result);
    });
  }
  render() {
    return (
      <p className="main-credit">
        Created by <a href="#">Tarique Ejaz</a>
      </p>
    );
  }
}

export default App;
