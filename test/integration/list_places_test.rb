require "test_helper"

class ListPlacesTest < ActionDispatch::IntegrationTest
  test "list places by list type" do
    get "/api/v1/places?type=list", headers: generate_token

    assert_response :ok

    body = JSON.parse(response.body)

    assert_equal "Empire State Building", body[0]["name"]
    assert_equal "Hospital São Lucas", body[1]["name"]
    assert_equal "Patão Supermercados", body[2]["name"]
    assert_equal "Unimed Pato Branco", body[3]["name"]
  end

  test "list places by map type" do
    get "/api/v1/places?type=map", headers: generate_token

    assert_response :ok

    # Checking the most distant
    assert_equal "Empire State Building", body[3]["name"]
  end

  test "list places without token" do
    get "/api/v1/places?type=map"

    assert_response :unauthorized
  end
end
