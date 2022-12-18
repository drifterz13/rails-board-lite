import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["items", "menuButton"]

  connect() {
    document.addEventListener('click', e => {
      const expanded = this.menuButtonTarget.getAttribute('aria-expanded')
      if (expanded === 'false') {
        return
      }

      const withinBoundaries = e.composedPath().includes(this.itemsTarget)
      if (!withinBoundaries) {
        this.itemsTarget.style.display = "none"
        this.menuButtonTarget.setAttribute('aria-expanded', "false")
      }
    })
  }


  toggle(e) {
    const expanded = this.menuButtonTarget.getAttribute('aria-expanded')
    switch (expanded) {
      case "true":
        this.itemsTarget.style.display = "none"
        this.menuButtonTarget.setAttribute('aria-expanded', "false")

        break

      case "false":
        this.itemsTarget.style.display = ""
        this.menuButtonTarget.setAttribute('aria-expanded', "true")

        const openMenuEvent = new CustomEvent('open-menu', { detail: { id: this.menuButtonTarget.id } })
        window.dispatchEvent(openMenuEvent)

        // Prevent click handler closing the menu.
        e.stopPropagation()

        break


      default:
    }
  }

  closeOtherMenu(e) {
    if (e.detail.id === this.menuButtonTarget.id) {
      return
    }

    this.itemsTarget.style.display = "none"
    this.menuButtonTarget.setAttribute('aria-expanded', "false")
  }
}
