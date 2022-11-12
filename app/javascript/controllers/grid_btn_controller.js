import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="grid-btn"
export default class extends Controller {
  connect() {
    // console.log("HELLO FROM GRID-BTN CONTROLLER!")
  }

  // Pseudocode

  change(event) {

    // event.preventDefault();

    const grids = ['grid-btn2', 'grid-btn4', 'grid-btn6', 'grid-btn1'];

    let currentClass = this.element.classList[0];
    let currentIndex = grids.indexOf(currentClass);

    const removeClass = (elementClass) => this.element.classList.remove(elementClass);
    const addClass = (elementClass) => this.element.classList.add(elementClass);

    // Updating the class of the grid button
    if(currentIndex < grids.length - 1) {
      removeClass(currentClass);
      currentIndex += 1;
      addClass(grids[currentIndex]);
    } else {
      removeClass(currentClass);
      currentIndex = 0;
      addClass(grids[currentIndex]);
    }

  }
}
