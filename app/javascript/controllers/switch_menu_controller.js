import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["page"]

  tst(event) {
    event.preventDefault()

    console.log(this.pageTarget)
  }
}
