require "test_helper"

class CreatePlaceTest < ActionDispatch::IntegrationTest
  test "create place" do
    post api_v1_places_path, params: params,
      headers: generate_token
    
    assert_response :created

    body = JSON.parse(response.body)

    assert_equal "Burguer King Pato Branco", body["name"]
    assert_equal "Pato Branco", body["city"] 
    assert_equal "Rua Caramuru", body["street"]
    assert_equal "Brasil", body["country"]
    assert_not_nil body["latitude"]
    assert_not_nil body["longitude"]
    assert_not_nil body["id"]

    # should have only "id", "name",
    # city, country, street
    # "latidude" and "longitude"
    assert body.size == 7  
  end

  test "create place without token" do
    post api_v1_places_path, params: params

    assert_response :unauthorized
  end

  def params
    {
      "name": "Burguer King Pato Branco",
      "city": "Pato Branco",
      "country": "Brasil",
      "street": "Rua Caramuru"
    }
  end
end
