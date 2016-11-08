class Package
  def initialize(weight,length,width,height)
    package = ActiveShipping::Package.new(weight * 16, [length,width,height], units: :imperials)
    return package
  end
end
