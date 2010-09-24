require 'rubygems'
require 'test/unit'
require 'named_delivery_methods'

class ActionMailerExtensionsTest < Test::Unit::TestCase

  def test_named_is_a_delivery_method
    assert ActionMailer::Base.delivery_methods.has_key? :named
    assert_equal NamedDeliveryMethods::DummyDeliveryMethod, ActionMailer::Base.delivery_methods[:named]
  end
  
end