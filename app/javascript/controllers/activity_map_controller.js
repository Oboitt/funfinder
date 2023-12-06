import { Controller } from 'stimulus';

export default class extends Controller {
  click(event) {
    const markerId = this.element.dataset.activityMapMarkerId;
    this.element.dispatchEvent(
      new CustomEvent('activityCardClicked', {
        bubbles: true,
        detail: { markerId: markerId },
      })
    );
  }
}
