import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="grid-btn"
// This controller adds grid to query string
export default class extends Controller {
  connect() {
    // console.log("HELLO FROM GRID-BTN CONTROLLER!")
  }

  change(event) {

    let searchParams = new URLSearchParams(window.location.search);
    const grids = [1, 2, 4, 6];
    let nextIndex = 1;

    if (searchParams.has("decade") && searchParams.has("grid")) {
      console.log("DECADE AND GRID")
      // Extracting the grid number from query string
      const grid = Number(searchParams.get("grid"));
      // Updating nextIndex
      const currentIndex = grids.indexOf(grid);
      nextIndex = currentIndex === 3 ? 0 : currentIndex + 1;

      console.log("Currnent Index", currentIndex)
      console.log("Next Index", nextIndex)
      console.log(searchParams);
      // Updating searchParams
      searchParams.delete('grid');
      searchParams.append('grid', grids[nextIndex]);
      console.log(searchParams);
      // Updating url
      window.location.search  = '?' + searchParams.toString();

    } else if (searchParams.has("decade")) {
      console.log("DECADE")
      // Updating searchParams
      searchParams.set('grid', grids[1]);
      // Updating nextIndex
      nextIndex = 2;
      // Updating url
      window.location.search  = '?' + searchParams.toString();

    } else if (searchParams.has("grid")) {
      console.log("GRID")
      // Extracting the grid number from query string
      const grid = Number(searchParams.get("grid"));
      // Updating nextIndex
      const currentIndex = grids.indexOf(grid);
      nextIndex = currentIndex === 3 ? 0 : currentIndex + 1;

      console.log("Currnent Index", currentIndex)
      console.log("Next Index", nextIndex)
      console.log(searchParams);
      // Updating searchParams
      searchParams.delete('grid');
      searchParams.append('grid', grids[nextIndex]);
      console.log(searchParams);
      // Updating url
      window.location.search  = '?' + searchParams.toString();

    } else if (searchParams.has("grid") === false & searchParams.has("decade") === false) {
      // When there is nothing in the url query
      console.log("NOTHING")

      // Updating searchParams
      searchParams.set('grid', grids[1]);
      console.log(searchParams)
      console.log("Next Index: ", nextIndex)
      // Updating nextIndex
      nextIndex = 2;
      console.log("Next Index: ", nextIndex)
      // Updating url
      console.log(window.location)
      window.location = window.location + '?' + searchParams.toString();
    }

    // console.log(searchParams);
    // window.location.reload();

    // const reloader = () => window.location.reload();
    // setTimeout(reloader, 1000);

  }
}
