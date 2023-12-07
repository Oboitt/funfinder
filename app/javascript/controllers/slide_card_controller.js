import { Controller } from "@hotwired/stimulus";
import Glide from "@glidejs/glide";

export default class extends Controller {
  static targets = ["glide"];

  connect() {
    this.initGlide();
  }

  initGlide() {
    new Glide(this.element, {
      type:"carousel", focusAt: 1, perView: 1.5, gap: 10
    }).mount();
  }
  next() {
    this.glide.go(">");
  }

  previous() {
    this.glide.go("<");
  }

  selectMarker() {
    const id = event.currentTarget.dataset.activityId
    const marker = document.querySelector(`#category-${id}`)
    marker.parentElement.click()
  }
}
