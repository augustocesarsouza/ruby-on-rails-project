import { Controller } from "@hotwired/stimulus"
import { Modal } from 'bootstrap'

// Connects to data-controller="remover-avatar-user"
export default class extends Controller {
  connect() {
    this.element.setAttribute("data-action", "click->remover-avatar-user#click_modal");
  }

  click_modal(e){
    e.preventDefault();

    const modal = new Modal(document.getElementById('confirmationModal'));
    modal.show()
  }

  disconnect() {
    this.modal.hide()
  }
}
