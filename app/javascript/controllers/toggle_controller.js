import { Controller } from "@hotwired/stimulus";


// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["togglableElement", "editRecipe", "details", "infoElement", "accordion" ]


  static values = { id: Number };


  connect() {
    this.toggled = false
    //console.log(this.accordionTargets)
    this.activateaccordion()
  }


  updatetoggle(){
    this.toggled = !this.toggled
    this.detailsTarget.classList.toggle("d-none")
  }

  recipe() {
    this.togglableElementTarget.classList.toggle("d-none")
  }

  info() {
    this.infoElementTarget.classList.toggle("d-none")
    console.log(this.infoElementTarget)

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

  activateaccordion(){

    var acc = this.accordionTargets
    var i;

    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
          panel.style.maxHeight = null;
        } else {
          panel.style.maxHeight = panel.scrollHeight + "px";
        }
      });
    }
  }

}
