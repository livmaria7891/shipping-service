require 'test_helper'
require 'rates'

class RatesTest < ActionController::TestCase
  # test "the truth" do
  #  assert true
  # end
  ORIGIN = ActiveShipping::Location.new(country: 'US',state: 'CA',city: 'Beverly Hills',zip: '90210')
  DESTINATION = ActiveShipping::Location.new(country: 'US', state: 'WA', city: 'Seattle', zip: '98118')
  PACKAGE = ActiveShipping::Package.new(7.5 * 16,[15, 10, 4.5], units: :imperial)

  test "Can create new instance of Rates" do
    a_test = Rates.new(ORIGIN, DESTINATION, PACKAGE)
    assert a_test.class == Rates
  end

  test "raises Exception if any parameters are missing" do
    assert_raises Exception do
      Rates.new()
    end

    assert_raises Exception do
      Rates.new(ORIGIN)
    end

    assert_raises Exception do
      Rates.new(ORIGIN, DESTINATION)
    end

    assert_raises Exception do
      Rates.new(ORIGIN, DESTINATION, nil)
    end

  end

  test "get_ups_rates returns a json" do
    

  end

  #test "#search returns json" do
  #   get :search, PARAMS
  #   assert_match 'application/json', response.header['Content-Type']
  # end


end
