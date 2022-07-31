import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("hello from the controller!");
  }

  showReview(event) {
    event.preventDefault();
    this.formTarget.classList.remove("d-none");
  }

  submit(event) {
    // this.showReview(event)
    if (!this.checkValidity()) {
      alert("Form is not filled out correctly");
      // console.log(this.checkValidity())
    }
  }

  checkValidity() {
    const reviewRating = document.getElementById("review_rating");
    const reviewContent = document.getElementById("review_content");

    if (reviewContent.value.length === 0 || reviewRating.value.length === 0 || reviewRating.value > 5 || reviewRating.value < 0) {
      return false
    } else {
      return true
    }
  }
}
