// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("turbolinks:load", function(){
  setupAttendeeForms();

  $("#add-attendee-button").on("click", function(){
    displayNextAttendeeForm();
  })

})

var visibleAttendeeForms = 0

function setupAttendeeForms() {
  var forms = document.getElementsByClassName("attendee-form");
  for(var i = 1; i < forms.length; i++) {
    forms[i].className += " hidden";
  }
}

function displayNextAttendeeForm() {
  var forms = document.getElementsByClassName("attendee-form");
  nextForm = visibleAttendeeForms + 1;
  forms[nextForm].className = "attendee-form";
  visibleAttendeeForms = nextForm;
}
