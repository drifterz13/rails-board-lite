import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
import { patch } from '@rails/request.js'

// Connects to data-controller="dnd"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      group: 'board',
      onEnd: (evt) => {
        const { item, to, newIndex } = evt

        const taskId = item.dataset.taskId
        const toTasklistId = to.dataset.tasklistId

        patch(`/tasks/${taskId}/sort`, {
          body: JSON.stringify({ position: newIndex + 1, tasklist_id: toTasklistId })
        })
      }
    })
  }
}
