json.comments do
  json.body @comment.body
  json.votes @comment.comment_vote_count
  json.user do
    json.username @comment.user.username
    json.id @comment.user.id
    json.profile_id @comment.user.profile.id
  end
end
