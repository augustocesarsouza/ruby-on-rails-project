import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="admin-modal"
export default class extends Controller {
  
  initialize() {
    console.log("Initializing Controller");
    
    this.element.setAttribute("data-action", "click->admin-modal#click_modal");
  }

  click_modal(e){
    e.preventDefault();
    this.url = this.element.getAttribute('href');
  
    fetch(this.url, {
      headers: { 
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(res => res.text())
    .then(html => Turbo.renderStreamMessage(html))
  }

  connect() {
    console.log("O controlador foi conectado!");
  }

  disconnect() {
  }
}
