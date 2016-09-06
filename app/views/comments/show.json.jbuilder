json.comments do
  json.body @comment.body
  json.user do
    json.username @comment.user.username
    json.id @comment.user.id
    json.profile_id comment.user.profile.id
  end
end
