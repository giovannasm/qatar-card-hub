import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="transaction"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log('transaction controller conected')
  }

  renderForm(event) {
    console.log(this.formTarget)
    this.formTarget.classList.toggle("d-none")
  }
}
