import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-item-actions"
export default class extends Controller {

  navigate_to_item_page() {
    var itemId = this.data.get('itemId');
    const itemUrl = `/shopping_items/${itemId}`;
    
    window.location.href = itemUrl;
  }

  toggle_stock() {
    var itemId = this.data.get('itemId');

    const csrfToken = document.querySelector("[name='csrf-token']").content
    
    fetch(`/shopping_items/${itemId}/toggle_stock`, {
      method: 'POST',
      headers: {
        "Accept": "text/vnd.turbo-stream.html", 
        "X-CSRF-Token": csrfToken
      },
    }).then (response => response.text())
    .then(html => {
      Turbo.renderStreamMessage(html);
    });
  }
}