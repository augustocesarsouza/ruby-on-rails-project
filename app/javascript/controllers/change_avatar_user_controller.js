import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="change-avatar-user"
export default class extends Controller {

  connect() {
    this.element.setAttribute("data-action", "click->change-avatar-user#change_avatar");
  }

  change_avatar(e){
    e.preventDefault();

    document.getElementById('avatar_input').click();
  }

  disconnect(){

  }
}
