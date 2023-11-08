import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-item-change"
export default class extends Controller {
  connect() {
    this.element.addEventListener('long-press', this.decrement.bind(this));
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
    .then(html => Turbo.renderStreamMessage(html));
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


