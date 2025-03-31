import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Hello from the toggle controller")
  }

  fire() {
    this.formTarget.classList.toggle("d-none")
  }
}
