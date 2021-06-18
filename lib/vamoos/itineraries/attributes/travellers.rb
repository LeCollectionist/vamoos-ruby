# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Travellers
        def travellers_attributes
          travellers&.map do |traveller|
            {
              name: traveller[:name],
              friendly_name: traveller[:friendly_name],
              details: traveller[:details], # C'est un objet et y'a pas ecrit ce qu'il y a dedans
              tag: traveller[:tag]
            }
          end
        end
      end
    end
  end
end
