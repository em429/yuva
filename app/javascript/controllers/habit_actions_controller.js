import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-actions"
export default class extends Controller {
  connect() {
    console.log("connected")
  }

  toggle_completion(event) {
    var habitId = event.target.dataset.habitActionsHabitId;
    var date = event.target.dataset.habitActionsDate;
    console.log("date", date);
 
    const csrfToken = document.querySelector("[name='csrf-token']").content
    
    fetch(`/habits/${habitId}/toggle_completion`, {
      method: 'POST',
      headers: {
        "Accept": "text/vnd.turbo-stream.html", 
        "X-CSRF-Token": csrfToken
      },
      body: JSON.stringify({ date: date })
    }).then (response => response.text())
    .then(html => {
      Turbo.renderStreamMessage(html);
      Turbo.clearCache();
      Turbo.visit(location.href, { action: 'replace' }); // Manually trigger a re-render
    });
  }
}