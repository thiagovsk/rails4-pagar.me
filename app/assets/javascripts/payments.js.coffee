$(document).on 'page:change', ->
  # quando o jQuery estiver carregado...
  # My example :
  #PagarMe.encryption_key = 'ek_test_ZdV1G1cH2JubFFrcPtIAYYr0A8IM2b'
  PagarMe.encryption_key = 'your encryption_key'
  form = $('#new_payment')
  form.submit (event) ->
    # quando o form for enviado...
    # inicializa um objeto de cartão de crédito e completa
    # com os dados do form
    creditCard = new (PagarMe.creditCard)
    creditCard.cardHolderName = $('#new_payment #payment_card_holder_name').val()
    creditCard.cardExpirationMonth = $('#new_payment #payment_card_expiration_month').val()
    creditCard.cardExpirationYear = $('#new_payment #payment_card_expiration_year').val()
    creditCard.cardNumber = $('#new_payment #payment_card_number').val()
    creditCard.cardCVV = $('#new_payment #payment_card_cvv').val()
    # pega os erros de validação nos campos do form
    fieldErrors = creditCard.fieldErrors()
    #Verifica se há erros
    console.log(creditCard.cardHolderName)
    console.log(creditCard.cardCVV)
    console.log(creditCard.cardExpirationMonth)
    console.log(creditCard.cardExpirationYear)
    console.log(creditCard.cardNumber)
    hasErrors = false
    for field of fieldErrors
      hasErrors = true
      break
    if hasErrors
      # realiza o tratamento de errors
      alert fieldErrors
    else
      # se não há erros, gera o card_hash...
      creditCard.generateHash (cardHash) ->
        # ...coloca-o no form...
        form.append $('<input type="hidden" name="payment[card_hash]" id="payment_card_hash">').val(cardHash)
        # e envia o form
        form.get(0).submit()
        console.log(cardHash)
        return
    false
  return
