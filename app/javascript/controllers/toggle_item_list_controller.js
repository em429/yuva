import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-item-list"
export default class extends Controller {
  static targets = ["list"]

  connect() {
    console.log("asd")
  }

  toggleList() {
    console.log("toggle")
    this.listTarget.classList.toggle('hidden')
  }

}
