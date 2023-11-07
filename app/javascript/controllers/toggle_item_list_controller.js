import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-item-list"
export default class extends Controller {
  static targets = ["list", "title"]

  toggleList() {
    this.listTarget.classList.toggle('hidden')
  }

}
