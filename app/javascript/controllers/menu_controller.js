import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["items", "menuButton"]

  toggle() {
    const expanded = this.menuButtonTarget.getAttribute('aria-expanded')
    switch (expanded) {
      case "true":
        this.itemsTarget.style.display = "none"
        this.menuButtonTarget.setAttribute('aria-expanded', "false")

        break

      case "false":
        this.itemsTarget.style.display = ""
        this.menuButtonTarget.setAttribute('aria-expanded', "true")

        break


      default:
    }
  }
}
