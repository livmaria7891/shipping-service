class Location
  def initialize(zip)
    loc = ZipCodes.identify(zip)
    location = ActiveShipping::Location.new(country: 'US', state: loc[:state_code], city: loc[:city], zip: zip)
    return location
  end

end
