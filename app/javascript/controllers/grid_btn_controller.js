import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="grid-btn"
export default class extends Controller {
  connect() {
    console.log("HELLO FROM GRID-BTN CONTROLLER!")
  }

  change(e) {

    e.preventDefault();

    const grids = ['grid-btn2', 'grid-btn4', 'grid-btn6', 'grid-btn1'];

    let currentClass = this.element.classList[0];
    let currentIndex = grids.indexOf(currentClass);

    if(currentIndex < grids.length - 1) {
      this.element.classList.remove(currentClass);
      currentIndex += 1;
      this.element.classList.add(`${grids[currentIndex]}`);
    } else {
      this.element.classList.remove(currentClass);
      currentIndex = 0;
      this.element.classList.add(`${grids[currentIndex]}`);
    }

  }
}
