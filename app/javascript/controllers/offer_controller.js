import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer"
export default class extends Controller {
  static targets =["form"]
  
  connect() {
    console.log('offer controller conected')
  }

  renderForm() {
    console.log(this.formTarget)
    this.formTarget.classList.toggle("d-none")
  }
}
