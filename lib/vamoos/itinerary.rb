# frozen_string_literal: true

module Vamoos
  class Itinerary < Api
    attr_accessor :id, :background, :client_reference, :created_at, :departure_date, :details,
                  :directories, :documents, :downloads, :features, :field1, :field2, :field3,
                  :flights, :is_active, :is_current_version, :is_listed, :is_public, :is_wiped,
                  :locations, :meta, :notifications, :operator_code, :operator_id,
                  :original_created_at, :passcode_groups, :pois, :reference_code,
                  :requested_listing_status, :return_date, :source, :travellers, :type, :updated_at,
                  :vamoos_id, :version

    def initialize(params)
      params.each { |key, value| send "#{key}=", value }
    end

    class << self
      def create!(reference_code, params)
        result = post_json("/itinerary/%<operator_code>s/#{reference_code}",
                           { body: params.to_json })

        Vamoos::Itinerary.new(result.parsed_response)
      end
    end
  end
end
