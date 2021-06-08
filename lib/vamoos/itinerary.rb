# frozen_string_literal: true

module Vamoos
  class Itinerary < Api
    attr_accessor :background, :client_reference, :copy_of_id, :created_at, :deactivated_at,
                  :deactivated_by, :departure_date, :details, :directories, :documents, :downloads,
                  :downloads_last30, :features, :field1, :field2, :field3, :field4, :flights, :id,
                  :inspiration, :is_active, :is_current_version, :is_listed, :is_public, :is_wiped,
                  :lead_traveller, :locations, :logo, :meta, :notifications, :operator_code,
                  :operator_id, :operator_name, :original_created_at, :passcode_groups, :pois,
                  :reference_code, :requested_listing_status, :return_date, :source, :start_time,
                  :timezone, :travellers, :type, :updated_at, :vamoos_id, :version

    def initialize(params)
      params.each { |key, value| send "#{key}=", value }
    end

    class << self
      def create_or_update!(reference_code, params)
        result = post_json("/itinerary/%<operator_code>s/#{reference_code}",
                           { body: params.to_json })

        Vamoos::Itinerary.new(result.parsed_response)
      end
    end
  end
end
