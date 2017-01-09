// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("turbolinks:load", function(){
  $("#graduates-table").DataTable({
    initComplete: function () {
      var column = this.api().column(1)
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
})
