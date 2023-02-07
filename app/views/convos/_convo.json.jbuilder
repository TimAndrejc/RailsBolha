json.extract! convo, :id, :post_id, :user_id, :created_at, :updated_at
json.url convo_url(convo, format: :json)
