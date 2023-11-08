import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-item-change"
export default class extends Controller {
  static values = { longPressDuration: Number }

  connect() {
    // Values needed for Long-press feature
    this.timeoutId = null
    this.longPressDurationValue = this.longPressDurationValue || 500 // Defaults to 500ms

    // Values and event listeners needed for accidental tap prevention while scrolling on phone
    this.isScrolling = false
    this.handleTouchStart = this.handleTouchStart.bind(this)
    this.handleTouchMove = this.handleTouchMove.bind(this)
    this.handleTouchEnd = this.handleTouchEnd.bind(this)
    this.element.addEventListener('touchstart', this.handleTouchStart) 
    this.element.addEventListener('touchmove', this.handleTouchMove)
    this.element.addEventListener('touchend', this.handleTouchEnd)
  }

  disconnect() {
    // Remove event listeners when the controller is disconnected
    this.element.removeEventListener('touchstart', this.handleTouchStart) 
    this.element.removeEventListener('touchmove', this.handleTouchMove)
    this.element.removeEventListener('touchend', this.handleTouchEnd)
  }
  
  handleTouchStart(event) {
    // Reset state on start of touch
    this.isScrolling = false
  }
  
  handleTouchMove(event) {
    // Set state to scrolling when touch moves
    this.isScrolling = true
  }
  
  handleTouchEnd(event) {
    // Reset state on end of touch
    this.isScrolling = false
  }
 
  startPress(event) {
    if (this.isScrolling) return // Do nothing if the user is scrolling

    this.timeoutId = setTimeout(() => {
      if (this.isScrolling) return // Do nothing if the user started scrolling during the long press
      event.preventDefault()
      this.decrement(event)
      this.timeoutId = null
    }, this.longPressDurationValue)
  }

  endPress(event) {
    if (this.isScrolling || this.timeoutId === null) return // Do nothing if the user is scrolling or if there's no timeout

    event.preventDefault()
    clearTimeout(this.timeoutId)
    this.timeoutId = null
    this.increment(event)
  }

  increment(event) {
    event.preventDefault();
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
      Turbo.renderStreamMessage(html);
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
    .then(html => {
      Turbo.renderStreamMessage(html);
    });
  } 
}


