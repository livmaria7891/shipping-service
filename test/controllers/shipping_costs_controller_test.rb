require 'test_helper'

class ShippingCostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  PARAMS = {merchant_zip: "55435", ship_to_zip:"90201", weight: 15, length: 20, width:20, height:20}

  test "can get #search" do

    get :search, PARAMS
    assert_response :ok
  end

  test "#search returns json" do
    get :search, PARAMS
    assert_match 'application/json', response.header['Content-Type']
  end

  test "#search returns an Array of Shipping Cost objects" do

    get :search, PARAMS
    # Assign the result of the response from the controller action
    body = JSON.parse(response.body)
    assert_instance_of Array, body
  end

  test "each Shipping Cost object contains the relevant keys" do
    keys = ["carrier","rate","service_name"]
    get :search, PARAMS

    body = JSON.parse(response.body)
    print body
    body.each do |ship_cost|
      keys_from_json = []
      ship_cost.each_key do |key|
        keys_from_json << key
      end
      keys_from_json.sort!
      assert_equal keys, keys_from_json
      
    end
  end

end
