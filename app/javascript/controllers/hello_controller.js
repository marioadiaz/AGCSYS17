import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hola desde Stimulus 🚀";
    //console.log("👋 Stimulus está funcionando en", this.element)
  }
}
