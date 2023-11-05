import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  connect() {
    this.timeout = null
  }

  save(event) {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      console.log("Autosaving..")
      // A regular this.formTarget.requestSubmit() would not work because it doesn't
      // set the turbo-stream headers, and would result in UnknownFromat from the controller.
      this.submitForm(event)
    }, 1000)
  }

  submitForm(event) {
    fetch(this.formTarget.action, {
      method: "put",
      body: new FormData(this.formTarget),
      headers: {
        // We set 'Accept' to 'text/vnd.turbo-stream.html' to specify that we want the 
        // server to respond with Turbo-Stream format.
        'Accept': 'text/vnd.turbo-stream.html',
        // We set 'Turbo-Frame' to 'scratchpad' to specify the id of the turbo-frame we want
        // the server to update.
        'Turbo-Frame': 'scratchpad'
      }
    })
  }



}