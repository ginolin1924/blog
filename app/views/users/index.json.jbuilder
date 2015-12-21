json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :role, :level
  json.url user_url(user, format: :json)
end
