$(document).ready ->
  # quando o jQuery estiver carregado...
  PagarMe.encryption_key = 'ek_test_Ec8KhxISQ1tug1b8bCGxC2nXfxqRmk'
  form = $('#payment_form')
  form.submit (event) ->
    # quando o form for enviado...
    # inicializa um objeto de cartão de crédito e completa
    # com os dados do form
    creditCard = new (PagarMe.creditCard)
    creditCard.cardHolderName = $('#payment_form #card_holder_name').val()
    creditCard.cardExpirationMonth = $('#payment_form #card_expiration_month').val()
    creditCard.cardExpirationYear = $('#payment_form #card_expiration_year').val()
    creditCard.cardNumber = $('#payment_form #card_number').val()
    creditCard.cardCVV = $('#payment_form #card_cvv').val()
    # pega os erros de validação nos campos do form
    fieldErrors = creditCard.fieldErrors()
    #Verifica se há erros
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
        form.append $('<input type="hidden" name="card_hash">').val(cardHash)
        # e envia o form
        form.get(0).submit()
        return
    false
  return
