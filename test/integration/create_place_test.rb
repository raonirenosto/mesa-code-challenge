require "test_helper"

class CreatePlaceTest < ActionDispatch::IntegrationTest
  test "create place" do
    post api_v1_places_path, params: params,
      headers: generate_token
    
    assert_response :created

    body = JSON.parse(response.body)

    assert_equal "Starbucks", body[:name]
    assert_equal "-22.836946", body[:latitude] 
    assert_equal "-47.024231", body[:longitude]
    assert_not_nil body[:id]

    # should have only "id", "name",
    #  "latidude" and "longitude"
    assert body.size == 4  
  end

  test "create place without token" do
    post api_v1_places_path, params: params

    assert_response :unauthorized
  end

  def params
    {
      "name": "Starbucks",
      "latitude": "-22.836946",
      "longitude": "-47.024231"
    }
  end
end
