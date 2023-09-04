import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-booking"
export default class extends Controller {
  static targets = ["bookingcard", "editform"]

  connect() {
    console.log("hi", this.bookingcardTarget, this.editformTarget)
    console.log("scope", this.element)
  }

  toggleedit(event){
    event.preventDefault()
    console.log(event.currentTarget)
    this.bookingcardTarget.classList.add("d-none")
    this.editformTarget.classList.remove("d-none")

    console.log("clicked")
  }
}
