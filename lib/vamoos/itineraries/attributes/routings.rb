# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Routings
        def routings_attributes
          {
            master: routing[:master],
            fallback: routing[:fallback],
            this: routing[:this],
            language: {
              en: routing.dig(:language, :en),
              fr: routing.dig(:language, :fr),
              ja: routing.dig(:language, :ja)
            }
          }
        end
      end
    end
  end
end
