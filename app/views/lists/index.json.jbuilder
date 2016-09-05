json.lists @lists do |list|
  json.title list.title
json.list list.list_restaurants do |rests|
    json.title rests.name
    json.list rests.list_experiences
  end
end
