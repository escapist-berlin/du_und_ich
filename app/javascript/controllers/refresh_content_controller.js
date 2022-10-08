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

    // adds query string to the url
    window.location.href = `${window.location.origin + window.location.pathname}?query=${event.target.innerHTML}`

    // const url = `${this.contentTarget.attributes[0].baseURI}?query=${this.firstDecadeTarget.innerText}`
    const url = window.location.href

    // console.log(url)

    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      console.log(data);
    })

  }
}
