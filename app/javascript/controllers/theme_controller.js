import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("coucou")
    console.log(this.formTarget)
    this.restoreSelection();
  }

  select(event) {
    event.currentTarget.classList.toggle("selected");
    console.log(event.currentTarget.dataset.themeId);
    const checkbox = document.querySelector(`[data-id="${event.currentTarget.dataset.themeId}"]`);
    console.log(checkbox);
    checkbox.checked = !checkbox.checked;

    this.saveSelection();
  }

  submit(event) {
    this.formTarget.submit();
  }

  // saveSelection() {
  //   const selectedThemes = Array.from(this.element.querySelectorAll(".theme-card.selected")).map(card => card.dataset.themeId);
  //   localStorage.setItem("selectedThemes", JSON.stringify(selectedThemes));
  // }

  // restoreSelection() {
  //   const selectedThemes = JSON.parse(localStorage.getItem("selectedThemes")) || [];
  //   selectedThemes.forEach(themeId => {
  //     const card = this.element.querySelector(`[data-theme-id="${themeId}"]`);
  //     if (card) {
  //       card.classList.add("selected");
  //     }
  //   });
  // }
}
