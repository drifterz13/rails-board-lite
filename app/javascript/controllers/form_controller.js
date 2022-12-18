import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ['input']

  connect() {
    this.inputTarget.select()
  }

  submit(e) {
    e.preventDefault()
    this.element.requestSubmit()

  }

  reset() {
    this.element.reset()
  }
}
