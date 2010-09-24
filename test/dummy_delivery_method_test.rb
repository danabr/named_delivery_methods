require 'rubygems'
require 'test/unit'
require 'named_delivery_methods'

class DummyDeliveryMethodTest < Test::Unit::TestCase

  def test_can_not_be_instantiated
    assert_raise(NamedDeliveryMethods::ConfigurationError) do
      NamedDeliveryMethods::DummyDeliveryMethod.new(nil)
    end
  end
end