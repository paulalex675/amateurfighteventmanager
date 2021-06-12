json.extract! fight_profile, :id, :user_id, :ring_name, :style_id, :gym_id, :gender, :fight_weight, :created_at, :updated_at
json.url fight_profile_url(fight_profile, format: :json)
