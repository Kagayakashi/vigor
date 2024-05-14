import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "tab"];

  switchTab(event) {
    const selectedLanguage = event.currentTarget.dataset.language;
    
    this.tabTargets.forEach(tab => {
      tab.classList.toggle("active", tab.dataset.language === selectedLanguage);
    });

    this.contentTargets.forEach(content => {
      content.classList.toggle("hidden", content.dataset.language !== selectedLanguage);
    });
  }
}
