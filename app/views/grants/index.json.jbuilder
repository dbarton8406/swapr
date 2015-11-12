json.array! @grants do |grant|
  json.id grant.id
  json.title grant.wish.title
  json.uploader grant.user.username
  json.details grant.details
  json.uploaded_at grant.created_at
end
