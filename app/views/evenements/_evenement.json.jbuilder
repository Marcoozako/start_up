json.extract! evenement, :id, :title, :date, :participant, :content, :created_at, :updated_at
json.url evenement_url(evenement, format: :json)
