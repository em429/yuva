import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-item-change"
export default class extends Controller {
  static values = { longPressDuration: Number }

  connect() {

    this.timeoutId = null
    this.longPressDurationValue = this.longPressDurationValue || 500 // Defaults to 500ms
  }

  startPress(event) {
    event.preventDefault()

    this.timeoutId = setTimeout(() => {
      this.decrement(event)
      this.timeoutId = null
    }, this.longPressDurationValue)
  }

  endPress(event) {
    event.preventDefault()

    if (this.timeoutId !== null) {
      clearTimeout(this.timeoutId)
      this.increment(event)
    }
  }

  increment(e) {
    e.preventDefault();
    
    var itemId = this.data.get('shoppingItemId');

    const csrfToken = document.querySelector("[name='csrf-token']").content

    console.log("incrementing..")
    fetch(`/shopping_items/${itemId}/increment`, {
      method: 'POST',
      headers: {
        "Accept": "text/vnd.turbo-stream.html", 
        "X-CSRF-Token": csrfToken,
        'Turbo-Frame': `shopping-item-${itemId}`
      },
    }).then (response => response.text())
    .then(html => {
      Turbo.renderStreamMessage(html)
    });
  }

  decrement(e) {
    e.preventDefault();

    
    var itemId = this.data.get('shoppingItemId');

    const csrfToken = document.querySelector("[name='csrf-token']").content

    console.log("decrementing..")
    fetch(`/shopping_items/${itemId}/decrement`, {
      method: 'POST',
      headers: {
        "Accept": "text/vnd.turbo-stream.html", 
        "X-CSRF-Token": csrfToken,
        'Turbo-Frame': `shopping-item-${itemId}`
      },
    }).then (response => response.text())
    .then(html => Turbo.renderStreamMessage(html));

  }


}


