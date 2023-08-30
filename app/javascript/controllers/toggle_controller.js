import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "editRecipe"]
  static values = { id: Number };


  connect() {
  }

  recipe() {
    this.togglableElementTarget.classList.toggle("d-none")
  }

  editRecipe() {
    this.editRecipeTarget.classList.toggle("d-none")
  }

  updateRecipe() {
    const formData = new FormData(this.editRecipeTarget.querySelector("form"));

    fetch(`/recipes/${this.idValue}`, {
      method: "PATCH",
      body: formData,
      headers: { "X-Requested-With": "XMLHttpRequest" }
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error("Network response was not ok.");
      }
    })
    .then(data => {
      
    })
    .catch(error => {
      console.error("Error updating recipe:", error);
    });
  }


  toggleRecipe(event) {
    event.preventDefault();
    this.recipe();
  }

}
