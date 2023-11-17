import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-hide"
export default class extends Controller {
  static targets = ["triggered", "trigger"]

  do() {
    this.triggeredTarget.classList.toggle('hidden')
  }

}
