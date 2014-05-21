json.array!(@association_tests) do |association_test|
  json.extract! association_test, :id, :title, :description
  json.url association_test_url(association_test, format: :json)
end
