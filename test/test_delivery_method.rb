require 'named_delivery_methods'

# Test class for testing delivery
# Uses :test as delivery method
class TestDeliveryMethod < NamedDeliveryMethods::NamedDeliveryMethod

  def initialize(settings)
    super(settings)
  end
  
  def name
    :primary
  end
  
  def method_name
    :test
  end
  
end