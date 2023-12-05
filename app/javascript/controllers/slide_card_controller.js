import { Controller } from "@hotwired/stimulus";
import Glide from "@glidejs/glide";

export default class extends Controller {
  static targets = ["glide"];

  connect() {
    this.initGlide();
  }

  initGlide() {
    new Glide(this.element, {
      type:"carousel", focusAt: "center", perView: 3, gap: 20, autoplay: 3000
    }).mount();
  }
  next() {
    this.glide.go(">");
  }

  previous() {
    this.glide.go("<");
  }
}
