import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-item-form"
export default class extends Controller {
  static targets = [ "form", "item_list" ]

  toggleForm(event) {
    event.preventDefault()
    // Account for the extra margin put on the list because of the parent's negative margin pulling
    // it under the category box, so it overlaps.

    // We toggle the mt-10 class on the item_list
    this.item_listTarget.classList.toggle('mt-10')
    // We also have to add a margin to the top of the form, again to account for the negative margin:
    this.formTarget.classList.toggle('mt-6')
    // finally, unhidde the form
    this.formTarget.classList.toggle('hidden')
  }
}
