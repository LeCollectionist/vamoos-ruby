# frozen_string_literal: true

module Vamoos
  class PointOfInterest < Api
    attr_accessor :country, :country_iso, :created_at, :created_by, :description, :icon, :icon_id,
                  :id, :is_default_on, :is_on, :itinerary_id, :latitude, :library_node,
                  :localisation, :location, :longitude, :meta, :name, :operator_id, :poi_range,
                  :position, :timezone, :updated_at

    def initialize(attrs)
      assign_attributes(attrs)
    end

    class << self
      def create!(attrs)
        result = post_json('/poi', { body: attrs.to_json })

        new(result.parsed_response)
      end

      def update!(poi_id, attrs)
        result = post_json("/poi/#{poi_id}", { body: attrs.to_json })

        new(result.parsed_response)
      end
    end
  end
end
