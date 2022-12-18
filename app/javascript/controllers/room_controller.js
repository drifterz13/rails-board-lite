import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="room"
export default class extends Controller {
  static targets = ['chatPane']

  initialize() {
    this.observer = new MutationObserver((mutationList) => {
      for (const mutation of mutationList) {
        if (mutation.type === 'childList') {
          console.log('A child node has been added or removed.');
          this.scrollToBottom()
        }
      }
    });

    this.observer.observe(this.chatPaneTarget, { childList: true, subtree: true });

  }

  connect() {
    this.scrollToBottom()
  }

  disconnect() {
    this.observer.disconnect()
  }

  scrollToBottom() {
    this.chatPaneTarget.scrollTop = this.chatPaneTarget.scrollHeight
  }
}
