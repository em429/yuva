import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-item-change"
export default class extends Controller {
  static values = { longPressDuration: Number, shoppingItemId: Number }

  connect() {
    this.timeoutId = null
    this.longPressDurationValue = this.longPressDurationValue || 500
    this.preventAction = false
  }

  startPress(event) {
    this.timeoutId = setTimeout(() => {
      event.preventDefault()
      // If long-press, toggle the stock
      this.toggle_stock(event)
      this.timeoutId = null
    }, this.longPressDurationValue)
  }

  // We check if the cursor / finger is still on the element and prevent
  // accidental actions if it's not
  movePress(event) {
    const rect = event.currentTarget.getBoundingClientRect()
    const inside = 
      rect.top <= event.clientY &&
      event.clientY <= rect.bottom &&
      rect.left <= event.clientX &&
      event.clientX <= rect.right

    if (!inside) {
      clearTimeout(this.timeoutId)
      this.timeoutId = null
      this.preventAction = true
    }
  }

  endPress(event) {
    // Do not fire if touch is outside rectangle
    if (this.preventAction) {
      this.preventAction = false
      return
    }

    event.preventDefault()
    clearTimeout(this.timeoutId)
    this.timeoutId = null
    // If short-press, navigate to item poage
    this.navigate_to_item_page(event)
  }


  navigate_to_item_page(event) {
    event.preventDefault();
    var itemId = this.data.get('shoppingItemId');
    const itemUrl = `/shopping_items/${itemId}`;
    
    window.location.href = itemUrl;
  }

  toggle_stock(event) {
    event.preventDefault();
    if (this.timeoutId === null) return; // Do nothing if there's no timeout

    var itemId = this.data.get('shoppingItemId');
    const csrfToken = document.querySelector("[name='csrf-token']").content

    console.log("toggling stock..")
    
    fetch(`/shopping_items/${itemId}/toggle_stock`, {
      method: 'POST',
      headers: {
        "Accept": "text/vnd.turbo-stream.html", 
        "X-CSRF-Token": csrfToken,
        'Turbo-Frame': `shopping-item-${itemId}`
      },
    }).then (response => response.text())
    .then(html => {
      Turbo.renderStreamMessage(html);
    });
  }

}


