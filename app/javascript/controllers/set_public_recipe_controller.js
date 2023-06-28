import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="set-public-recipe"
export default class extends Controller {
	connect() {
		this.element.setAttribute("data-action", "change->set-public-recipe#toggle");
	}

	toggle() {
		const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
		const csrfParam = document.querySelector('meta[name="csrf-param"]').getAttribute("content");

		fetch(`/recipes/${this.element.value}`, {
			method: "PATCH",
			headers: {
				Accept: "text/vnd.turbo-stream.html",
				"Content-Type": "application/json",
				"X-CSRF-Token": csrfToken,
			},
			body: JSON.stringify({ [csrfParam]: csrfToken, public: this.element.checked }),
		})
			.then((res) => res.text())
			.then((html) => {
				this.updateHiddenField();
			});
	}

	updateHiddenField() {
		const hiddenField = this.element.previousElementSibling;
		hiddenField.value = this.element.checked ? "1" : "0";
	}
}
