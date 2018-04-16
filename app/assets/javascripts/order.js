$(document).on('turbolinks:load', function() {

  $('#order_client_id').on('change', function() {
    var clientName = $('#order_client_id').find(":selected").text();
    if (clientName == "CONSUMIDOR FINAL") {
      $('#common-client').slideDown(200);
    } else {
      $('#common-client').slideUp(200);
    };
  });

  // Check all
  $("#checkAllDone").on('change', function() {
    $(".order_articles_done").children().children().children().prop("checked", $(this).prop("checked"))
  });

  $("#checkAllDelivered").on('change', function() {
    $(".order_articles_delivered").children().children().children().prop("checked", $(this).prop("checked"))
  });

  $("#checkAllInvoiced").on('change', function() {
    $(".order_articles_invoiced").children().children().children().prop("checked", $(this).prop("checked"))
  });

  $("#checkAllPayed").on('change', function() {
    $(".order_articles_payed").children().children().children().prop("checked", $(this).prop("checked"))
  });

  $("#checkAllProcess").on('change', function() {
    $(".order_articles_process").children().children().children().prop("checked", $(this).prop("checked"))
  });

  $("#checkAllDelivery").on('change', function() {
    $(".order_articles_on_delivery").children().children().children().prop("checked", $(this).prop("checked"))
  });

});
