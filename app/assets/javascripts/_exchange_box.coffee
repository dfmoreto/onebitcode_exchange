convert = ->
  $.ajax '/exchange',
        type: 'POST',
        dataType: 'json',
        data: {
          currency: $("#currency").val(),
          currency_destination: $("#currency_destination").val(),
          quantity: $("#quantity").val()
        },
        error: (jqXHR, textStatus, errorThrown) ->
          alert(textStatus)
        success: (data, text, jqXHR) ->
          $("#result").val(data.value)

$(document).ready ->
  $("#currency, #currency_destination").change ->
    convert()

  $("#quantity").keydown ->
    convert()

  $(".switch_currency").click ->
    currencyVal = $("#currency").val()
    $("#currency").val($("#currency_destination").val())
    $("#currency_destination").val(currencyVal)
    convert()

