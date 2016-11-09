class ShippingCostsController < ApplicationController

  def search
    #Location -Merchant

    loc1 = ZipCodes.identify(params[:merchant_zip])
    origin = ActiveShipping::Location.new(country: 'US', state: loc1[:state_code], city: loc1[:city], zip: params[:ship_to_zip])

    #Location - destination
    loc2 = ZipCodes.identify(params[:ship_to_zip])
    destination = ActiveShipping::Location.new(country: 'US', state: loc2[:state_code], city: loc2[:city], zip: params[:ship_to_zip])

    #package
    package = ActiveShipping::Package.new(params[:weight].to_i  * 16, [params[:length].to_i, params[:width].to_i, params[:height].to_i], units: :imperial)

    rates = Rates.new(origin, destination, package)
    logger.info(rates)
    render json: rates.json


  end


end
