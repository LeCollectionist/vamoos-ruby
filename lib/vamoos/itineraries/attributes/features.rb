# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Features
        def features_attributes
          features&.flat_map do |feature|
            feature[:features] { |feat| { id: feat[:id], is_featured: feat[:is_featured] } }
          end
        end
      end
    end
  end
end
