import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("hello from nav controller")
  }

  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("navbar-lewagon-purple")
    } else {
      this.element.classList.remove("navbar-lewagon-purple")
    }
  }
}
