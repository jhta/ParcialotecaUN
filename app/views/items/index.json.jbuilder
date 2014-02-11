json.array!(@items) do |item|
  json.extract! item, :id, :nombre, :tipo, :descripcion, :fecha, :peso, :formato, :id_materia
  json.url item_url(item, format: :json)
end
