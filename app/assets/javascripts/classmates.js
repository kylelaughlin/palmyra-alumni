// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).on("turbolinks:load", function(){

  $("#class-selector").change(function(){
    var classYear = this.value;
    $.ajax({
      url: '/classmates',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      method: 'get',
      data: { class: classYear }
    })
  })

})
