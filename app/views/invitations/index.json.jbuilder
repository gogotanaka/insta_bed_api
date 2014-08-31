json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :price, :address, :describe
  json.url invitation_url(invitation, format: :json)
end
