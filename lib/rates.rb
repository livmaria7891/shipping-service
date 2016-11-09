class Rates
  def initialize(origin, destination, package)
    @origin = origin
    @destination = destination
    @package = package

  end

  def get_ups_rates
    ups = ActiveShipping::UPS.new(login: ENV['ACTIVESHIPPING_UPS_LOGIN'], password: ENV['ACTIVESHIPPING_UPS_PASSWORD'], key: 'ACTIVESHIPPING_UPS_KEY')
    response = ups.find_rates(@origin, @destination, @package)

    ups_json = jsonize(response)
    return ups_json
  end

  def get_usps_rates
    usps = ActiveShipping::USPS.new(login: 'ACTIVESHIPPING_USPS_LOGIN')
    response = usps.find_rates(@origin, @destination, @package)

    usps_json = jsonize(response)
    return usps_json
  end

  # def get_fedex_rates
  #   fedex = ActiveShipping::FedEx.new(login: '999999999', password: '7777777', key: '1BXXXXXXXXXxrcB', account: '51XXXXX20')
  #   response = fedex.find_rates(@origin, @destination, @package)
  #
  #   fedex_json = jsonize(response)
  #   return fedex_json
  # end

  def jsonize(response)
    jsonized = []
    response.each do |rate|
      jsonized[rate[0]] = rate[1]
    end
  end

  def create_json
    results = [get_ups_rates, get_usps_rates].flatten

    return results
  end

end
