# frozen_string_literal: true

module Vamoos
  module Helpers
    module Attributes
      def assign_attributes(attrs)
        attrs.deep_symbolize_keys.each do |attribute_name, attribute_value|
          send("#{attribute_name}=", attribute_value)
        rescue NoMethodError
          self.properties ||= {}
          self.properties[attribute_name] = attribute_value
        end
      end
    end
  end
end
