# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Pois
        def pois_attributes
          pois&.map do |poi|
            {
              id: poi[:id],
              is_on: poi[:is_on]
            }
          end
        end
      end
    end
  end
end
