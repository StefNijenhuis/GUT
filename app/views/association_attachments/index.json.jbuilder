json.array!(@association_attachments) do |association_attachment|
  json.extract! association_attachment, :id, :association_test_id, :image
  json.url association_attachment_url(association_attachment, format: :json)
end
