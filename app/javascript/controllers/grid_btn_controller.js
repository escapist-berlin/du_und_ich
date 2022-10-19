import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="grid-btn"
export default class extends Controller {
  connect() {
    console.log("HELLO FROM GRID-BTN CONTROLLER!")
  }

  change(event) {

    event.preventDefault();

    const grids = ['grid-btn2', 'grid-btn4', 'grid-btn6', 'grid-btn1'];

    let currentClass = this.element.classList[0];
    let currentIndex = grids.indexOf(currentClass);

    // Updating the class of the grid button
    if(currentIndex < grids.length - 1) {
      this.element.classList.remove(currentClass);
      currentIndex += 1;
      this.element.classList.add(`${grids[currentIndex]}`);

      // Updating the url if there is a query string or not
      let currentURL = event.target.baseURI;
      let queryString = window.location.search; // we can check if there is a query string

      if (queryString.length === 0) {
        window.location.href = `${currentURL}?grid=${grids[currentIndex]}`;
        console.log(queryString);
      } else {
        window.location.href = `${currentURL}&grid=${grids[currentIndex]}`;
        console.log(queryString);
      }


    } else {
      this.element.classList.remove(currentClass);
      currentIndex = 0;
      this.element.classList.add(`${grids[currentIndex]}`);


      // Updating the url if there is a query string or not
      let currentURL = event.target.baseURI;
      let queryString = window.location.search;

      if (queryString.length === 0) {
        window.location.href = `${currentURL}?grid=${grids[currentIndex]}`;
        console.log(queryString);
      } else {
        window.location.href = `${currentURL}&grid=${grids[currentIndex]}`;
        console.log(queryString);
      }


    }

  }
}
