
import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    console.log("Sortable loaded")
    Sortable.create(this.element, {
      ghostClass: "ghost",
      animation: 150,
    })
  }
}
