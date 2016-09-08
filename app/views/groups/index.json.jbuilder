json.lists @groups do |group|
  json.group group
  json.id group.id
  json.name group.name
  json.description group.description
  json.avatar group.avatar.url
end
