import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh-content"
// This controller adds decade to query string
export default class extends Controller {
  static targets = ["content", "footer"]

  connect() {
    // console.log(this.element)
  }

  update(event) {
    // event.preventDefault()
    let searchParams = new URLSearchParams(window.location.search);
    let decadeString = event.target.innerHTML;
    const decadeHref = event.target.offsetParent.href;

    searchParams.set('decade', decadeString);
    window.location.href = decadeHref + '?' + searchParams.toString();
  }
}
