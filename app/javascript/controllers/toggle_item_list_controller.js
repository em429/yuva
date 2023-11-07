import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-item-list"
export default class extends Controller {
  static targets = ["list", "title"]

  toggleList() {
    this.listTarget.classList.toggle('hidden')
    
    // Add shadow to category title box after hiding the list
    this.titleTarget.classList.toggle('shadow-md')
    this.titleTarget.classList.toggle('shadow-stone')
  }

}
