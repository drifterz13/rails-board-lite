import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const delay = 2500

    setTimeout(() => {
      this.element.remove()
    }, delay)
  }
}
