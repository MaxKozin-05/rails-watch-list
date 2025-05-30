import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title"]

  toggle() {
     this.titleTarget.classList.toggle("text-red")
    document.body.classList.toggle("bg-black")
  }
}
