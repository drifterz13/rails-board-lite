import { Controller } from "@hotwired/stimulus"
import { Turbo } from '@hotwired/turbo-rails'

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

  cancel() {
    Turbo.visit('/tasklists', { action: 'replace' })
  }
}
