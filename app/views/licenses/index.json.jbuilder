json.array!(@licenses) do |license|
  json.extract! license, :id, :consumerAmount, :consumerType, :issuer, :subject, :holder, :notAfter, :info, :companyName, :contactName, :contactEmail, :user_id
  json.url license_url(license, format: :json)
end
