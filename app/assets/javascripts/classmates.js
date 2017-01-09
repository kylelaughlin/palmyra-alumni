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

  initAdminIndex();

})


function initAdminIndex() {
  $("#admin-classmates-table").DataTable({
    "lengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]],
    initComplete: function () {
      var column = this.api().column(5)
      var select = $('<select><option value=""></option></select>')
        .appendTo( $(column.header()) )
        .on( 'change', function() {
          var val = $.fn.dataTable.util.escapeRegex(
            $(this).val()
          );
          column
            .search( val ? '^'+val+'$' : '', true, false )
            .draw();
        });
      column.data().unique().sort().each( function ( d, j ) {
        select.append( '<option value="'+d+'">'+d+'</option>')
      });
    }
  })
}
