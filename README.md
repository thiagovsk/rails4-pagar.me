# Aplicação teste para o pagar.me

Simples aplicação de testes para rodar a API do pagar.me .

[![Stories in Ready](https://badge.waffle.io/thiagovsk/rails4-pagar.me.svg?label=ready&title=Ready)](http://waffle.io/thiagovsk/rails4-pagar.me)

Para poder testar basta adicionar a sua  chave de API e chave de criptografia (utilizem os dados de teste).

Você encontrar essas informações dentro da suas configurações no site pagar.me

A chave API você coloca em app/models/transaction.rb

por exeplo:


```ruby
PagarMe.api_key = "ak_test_Po52jGJ5XIWiutdmkZc7lpccveMUoh";
```

A chave de criptografia você coloca em app/assets/javascripts/payments.js.coffee

por exemplo:

```ruby
PagarMe.encryption_key = 'ek_test_ZdV1G1cH2JubFFrcPtIAYYr0A8IM2b'
```

Lembrando que essas chaves de exemplo não vão te servir, pois são as chaves de teste da minha conta, logo alterarem para a chave de teste de vocês, assim verão as transações na dashboard do pagar.me.

Por fim basta:

```shell
rake db:migrate
rails server
```

