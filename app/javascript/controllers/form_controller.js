import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ['input']

  connect() {
    this.inputTarget.select()
  }

  submit() {
    this.element.submit()
  }

  reset() {
    this.element.reset()
  }
}
