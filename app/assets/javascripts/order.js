$(document).on('turbolinks:load', function() {

  $('#order_client_id').on('change', function() {
    var clientName = $('#order_client_id').find(":selected").text();
    if (clientName == "Consumidor final") {
      $('#common-client').slideDown(200);
    } else {
      $('#common-client').slideUp(200);
    };
  });
});