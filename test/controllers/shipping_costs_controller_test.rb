require 'test_helper'

class ShippingCostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can get #search" do
    get :search
    assert_response :ok
  end

  test "#search returns json" do
    get :search
    assert_match 'application/json', response.header['Content-Type']
  end

  test "#search returns an Array of Shipping Cost objects" do
    get :search
    # Assign the result of the response from the controller action
    body = JSON.parse(response.body)
    assert_instance_of Array, body
  end

  test "returns six Shippping Cost objects" do
    get :search
    body = JSON.parse(response.body)
    assert_equal 6, body.length
  end

  test "each Shipping Cost object contains the relevant keys" do
    keys = [:price,:service_name]
    get :search

    body = JSON.parse(response.body)
    body.each do |ship_cost|
      ship_cost.map(&:keys).sort
    end
  end

end
