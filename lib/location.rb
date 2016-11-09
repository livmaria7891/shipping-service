class Location

  def initialize(zip)
    loc = ZipCodes.identify(zip)
    return ActiveShipping::Location.new(country: 'US', state: loc[:state_code], city: loc[:city], zip: zip)

  end

end
