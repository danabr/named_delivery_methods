require 'rails'
require 'named_delivery_methods/named_delivery_method'

module NamedDeliveryMethods
  class Railtie < Rails::Railtie
    # Registers the delivery methods specified by
    # config.action_mailer.configurable_settings
    initializer "register_delivery_methods" do |app|
      if app.config.action_mailer.delivery_method == :named
        settings = app.config.action_mailer.named_settings
        settings.each do |name, method|
          unless method[:method].nil?
            add_delivery_method(name, method[:method], method[:settings] || {} )
          else
            raise NamedDeliveryMethods::ConfigurationError.new("No method specified for delivery method #{name}")
          end
        end
      end
    end
    
    private
    
    # Adds a delivery method to ActionMailer.
    def add_delivery_method(name, method, settings)
      dm_class = Class.new(::NamedDeliveryMethods::NamedDeliveryMethod)
      dm_class.class_eval("def name; :'#{name}'; end")
      dm_class.class_eval("def method_name; :#{method.to_sym}; end")
      dm_class.class_eval("def initialize(settings); super(settings); end")
      ::ActionMailer::Base.add_delivery_method(name, dm_class, settings)
    end
  end
end