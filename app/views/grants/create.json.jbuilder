json.id @grant.id
json.title @grant.wish.title
json.upload do
  json.uploader @grant.user.username
  json.filename @grant.gift_file_name
  json.filesize @grant.gift_file_size
end
json.details @grant.details
