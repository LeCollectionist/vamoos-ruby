# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Details
        def details_attributes
          details&.map do |detail|
            { headline: detail[:headline],
              tag: detail[:tag],
              content: detail[:content],
              position: detail[:position],
              location_internal_id: detail.dig(:location, :id),
              meta: detail[:meta],
              documents: detail[:documents]&.map { |document| attachment(document) },
              image: attachment(detail[:image]) }
          end
        end
      end
    end
  end
end
