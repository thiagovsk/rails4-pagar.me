json.array!(@payments) do |payment|
  json.extract! payment, :id, :card_number, :card_holder_name, :card_expiration_month, :card_expiration_year, :card_cvv, :card_hash
  json.url payment_url(payment, format: :json)
end
