import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  open() {
    this.element.hidden = false
  }

  close() {
    this.element.hidden = true
    const modalContent = this.element.querySelector('#modal_content')
    while (modalContent.firstChild) {
      modalContent.removeChild(modalContent.firstChild);
    }
  }
}
