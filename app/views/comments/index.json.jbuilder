json.comments @comments do |comment|
  json.body comment.body
  json.user do
    json.username comment.user.username
    json.id comment.user.id
  end
end
