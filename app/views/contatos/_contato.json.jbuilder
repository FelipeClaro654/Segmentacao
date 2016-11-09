json.extract! contato, :id, :nome, :email, :idade, :estado_id, :cargo, :created_at, :updated_at
json.url contato_url(contato, format: :json)