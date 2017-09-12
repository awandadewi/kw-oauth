json.data do |data|
  json.(@loan,
    :id,
    :amount,
    :detail,
    :user_email,
    :created_at,
    :updated_at
  )
end
