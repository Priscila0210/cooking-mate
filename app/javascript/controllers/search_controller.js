import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = ["form", "input", "list", "button"]

  connect() {

  }

  update() {
    if (this.inputTarget.value != "") {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
    }
    else {
      const url = `${this.formTarget.action}?query=`
      console.log(url)
      fetch(url, {headers: {"Accept": "text/plain"}})
        .then(response => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data
        })
      }
  }
  filter(event) {
    const url = `${this.formTarget.action}?query=${event.target.innerText}`
      console.log(event.target.innerText)
      fetch(url, {headers: {"Accept": "text/plain"}})
        .then(response => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data
        })
  }





}
