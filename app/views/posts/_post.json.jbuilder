json.extract! post, :id, :cotent, :created_at, :updated_at
json.url post_url(post, format: :json)
json.cotent post.cotent.to_s
