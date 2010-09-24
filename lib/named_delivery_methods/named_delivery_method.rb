module NamedDeliveryMethods
  # A delivery method acting as a named facade to a real delivery method.
  # This particular class acts as an abstract base class.
  # Subclasses should override the 'method' and 'name' methods.
  class NamedDeliveryMethod
    
    # Initializes a named delivery method
    # - settings: Settings for the delivery method
    def initialize(settings)
      @settings = settings
      @delivery_method = nil
    end
    
    attr_accessor :settings
    
    # Delivers the given mail
    def deliver!(mail)
      delivery_method.deliver!(mail)
    end
    
    private
    
    # Returns the delivery real delivery method to be used
    def delivery_method
      if @delivery_method.nil?
        dm = Mail::Configuration.instance.lookup_delivery_method(method_name)
        @delivery_method = dm.new(settings)
      end
      @delivery_method
    end
  end
end