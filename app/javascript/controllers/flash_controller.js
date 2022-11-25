import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    const timeout = 5000
    setTimeout(() => {
      this.element.remove()
    }, timeout)
  }
}
