# frozen_string_literal: true

module Vamoos
  module Helpers
    module Attributes
      def assign_attributes(attrs)
        attrs.deep_symbolize_keys.each do |key, value|
          send("#{key}=", value)
        end
      end
    end
  end
end
