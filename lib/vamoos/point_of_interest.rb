# frozen_string_literal: true

module Vamoos
  class PointOfInterest < Api
    attr_accessor :id, :country, :country_iso, :created_at, :description, :icon, :icon_id,
                  :is_default_on, :latitude, :longitude, :meta, :name, :operator_id, :poi_range,
                  :updated_at

    def initialize(params)
      params.each { |key, value| send "#{key}=", value }
    end

    class << self
      def create!(params)
        result = post_json('/poi', { body: params.to_json })

        Vamoos::PointOfInterest.new(result.parsed_response)
      end

      def update!(poi_id, params)
        result = put_json("/poi/#{poi_id}", { body: params.to_json })

        Vamoos::PointOfInterest.new(result.parsed_response)
      end
    end
  end
end
