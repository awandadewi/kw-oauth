json.data do |data|
  json.(@company,
    :id,
    :name,
    :ref_id,
    :pic,
    :meta,
    :approved,
    :created_at,
    :updated_at
  )
end
