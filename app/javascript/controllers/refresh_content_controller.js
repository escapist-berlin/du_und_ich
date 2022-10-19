import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh-content"
export default class extends Controller {
  static targets = ["content", "footer"]

  connect() {
    // console.log(this.element)
    // console.log(this.contentTarget)
  }

  update(event) {
    event.preventDefault()

    // Adding query string with decade
    // First variant
    // window.location.href = `${event.target.offsetParent.href}?query=${event.target.innerHTML}`

    // Second variant
    let searchParams = new URLSearchParams(window.location.search);
    let decadeString = event.target.innerHTML;
    const decadeHref = event.target.offsetParent.href;

    searchParams.set('query', decadeString);
    window.location.href = decadeHref + '?' + searchParams.toString();

  }
}
