module NamedDeliveryMethods
  # Dummy delivery method.
  # Will raise an error when instantiated.
  class DummyDeliveryMethod
    def initialize(settings)
      raise NamedDeliveryMethods::ConfigurationError.new("No delivery method has been selected!")
    end
  end  
end