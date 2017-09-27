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
          $("#open_email_card").prop("disabled", false)
        beforeSend: ->
          $("#email_container").hide()
          $("#open_email_card").prop("disabled", true)


$(document).ready ->
  $("#currency, #currency_destination").change ->
    convert()

  $("#quantity").keydown ->
    convert()

  $(".switch_currency").click ->
    currencyVal = $("#currency").val()
    $("#currency").val($("#currency_destination").val())
    $("#currency_destination").val(currencyVal)
    $("#currency, #currency_destination").trigger("change");
    convert()


  $("#open_email_card").click ->
    $("#email_container").show()

  $("#send_email").click ->
    $.ajax '/send_email',
        type: 'POST',
        dataType: 'json',
        data: {
          email: $("#email").val(),
          currency: $("#currency").val(),
          currency_destination: $("#currency_destination").val(),
          quantity: $("#quantity").val(),
          result: $("#result").val()
        },
        error: (jqXHR, textStatus, errorThrown) ->
          alert("Ocorreu um erro ao enviar o email")
        success: (data, text, jqXHR) ->
          alert("Email enviado com sucesso!")
          $("#email_container").hide()

