require 'rubygems'
require 'test/unit'
require 'ostruct'
require 'named_delivery_methods'

class RailtieTest < Test::Unit::TestCase

  def test_does_nothing_if_delivery_method_is_not_named
    # Setting named_settings to nil will result in a crash if processing is allowed to go on
    app = make_app :delivery_method => :test, :named_settings => nil
    railtie = NamedDeliveryMethods::Railtie.new
    assert_nothing_raised { railtie.run_initializers(app) }
  end
  
  def test_initializer
    pre_initializer_dm_count = ActionMailer::Base.delivery_methods.size
    
    app = make_app :delivery_method => :named, :named_settings => {
      :primary => {:method => :smtp, :settings => {:port => 25}},
      :secondary => {:method => :test}
      }
    
      railtie = NamedDeliveryMethods::Railtie.new
      assert_nothing_raised { railtie.run_initializers(app) }
      
      #Make sure the delievery methods were added
      assert_equal pre_initializer_dm_count+2, ActionMailer::Base.delivery_methods.size
      
      assert_delivery_method(ActionMailer::Base.delivery_methods[:primary],
                            :method => :smtp, :name => :primary, :settings => {:port => 25})
      assert_delivery_method(ActionMailer::Base.delivery_methods[:secondary],
                            :method => :test, :name => :secondary, :settings => {})
  end
  
  def test_method_name_must_be_given
    app = make_app :delivery_method => :named, :named_settings =>
      {:primary => {:settings => {:port => 25}}}
    
    assert_raise(NamedDeliveryMethods::ConfigurationError) do
      NamedDeliveryMethods::Railtie.new.run_initializers(app)
    end
  end
  
  private 
  
  def assert_delivery_method(dm, hash)
    assert !dm.nil?
    assert_equal NamedDeliveryMethods::NamedDeliveryMethod, dm.superclass
    
    dmi = dm.new(hash[:settings])
    assert_equal hash[:settings], dmi.settings
    assert_equal hash[:method], dmi.method_name
    assert_equal hash[:name], dmi.name
  end
  
  def make_app(delivery_hash)
    OpenStruct.new(:config => OpenStruct.new(:action_mailer => 
      OpenStruct.new(delivery_hash)))
  end
end