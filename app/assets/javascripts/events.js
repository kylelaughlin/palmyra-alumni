// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("turbolinks:load", function() {
  setupEventOptionForms();

  $("#event-option-button").on("click", function() {
    addEventOptionForm();
  });
})

function setupEventOptionForms() {
  var forms = document.getElementsByClassName("event-option-form");
  for(var i = 1; i < forms.length; i++) {
    forms[i].className += " hidden";
  }
}

var visibleEventOptionForms = 0

function addEventOptionForm() {
  var forms = document.getElementsByClassName("event-option-form");
  nextForm = visibleEventOptionForms + 1
  forms[nextForm].className = "event-option-form"
  visibleEventOptionForms = nextForm;
}
