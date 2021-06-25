# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Documents
        def documents_attributes
          return if documents.blank?

          {
            travel: documents[:travel]&.map { |document_travel| attachment(document_travel) },
            destination: documents[:destination]&.map do |document_destination|
              attachment(document_destination)
            end
          }
        end
      end
    end
  end
end
