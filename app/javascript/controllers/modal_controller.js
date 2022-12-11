import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  open() {
    this.element.hidden = false
  }

  close() {
    this.element.hidden = true
  }
}
