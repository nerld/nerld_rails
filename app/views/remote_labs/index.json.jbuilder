json.array!(@remote_labs) do |remote_lab|
  json.extract! remote_lab, :id, :title, :version, :author, :school, :user_id
  json.url remote_lab_url(remote_lab, format: :json)
end
