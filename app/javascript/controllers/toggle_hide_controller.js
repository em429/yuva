import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-hide"
export default class extends Controller {
  static targets = ["content", "itemForm"]

  toggleContent() {
    this.contentTarget.classList.toggle('hidden')
  }

  toggleForm() {
    this.itemFormTarget.classList.toggle('hidden')
  }

}
