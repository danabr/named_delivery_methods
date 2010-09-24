require 'rubygems'
require 'test/unit'
require 'named_delivery_methods'
require 'test_delivery_method'

class NamedDeliveryMethodTest < Test::Unit::TestCase
  
  def test_delivery_delegates_correctly
    dm = TestDeliveryMethod.new({})
    dm.deliver!({})
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
  
  # TODO
  def test_lookup
    # Should test delivery method lookup...
  end
  
end