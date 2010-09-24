require 'action_mailer'
require 'named_delivery_methods/dummy_delivery_method'

class ActionMailer::Base
  # Add a dummy delivery method, simplifying configuration, 
  # and making it possible to detect whether named delivery 
  # methods should be used.
  add_delivery_method(:named, ::NamedDeliveryMethods::DummyDeliveryMethod)
end