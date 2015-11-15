module Spree
  Address.class_eval do
    _validators.reject!{ |key, value| key }
    _validate_callbacks.each do |callback|
      callback.raw_filter.attributes.reject! { |key| key  } if callback.raw_filter.respond_to?(:attributes)
    end
  end
end