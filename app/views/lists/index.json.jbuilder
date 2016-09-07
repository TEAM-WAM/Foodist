
json.lists @lists do |list|
  json.list list
  json.id list.id
  json.title list.title
  json.votes list.votes
  json.vote_count list.list_vote_count
  json.comments list.comments do |comment|
    json.comment comment
    json.votes comment.votes
    json.user comment.user
  end
  json.restaurants list.list_restaurants do |rest|
    json.list rest
    json.title rest.name
    json.id rest.id
    json.restaurant rest.restaurant
    json.experiences rest.list_experiences
  end
end
