# frozen_string_literal: true

require_relative 'itineraries/attributes'

module Vamoos
  class Itinerary < Api
    include Itineraries::Attributes

    attr_accessor :background, :client_reference, :copy_of_id, :created_at, :deactivated_at,
                  :deactivated_by, :departure_date, :details, :directories, :documents, :downloads,
                  :downloads_last30, :features, :field1, :field2, :field3, :field4, :flights, :id,
                  :inspiration, :is_active, :is_current_version, :is_listed, :is_public, :is_wiped,
                  :lead_traveller, :locations, :logo, :meta, :notifications, :operator_code,
                  :operator_id, :operator_name, :original_created_at, :passcode_groups, :pois,
                  :reference_code, :requested_listing_status, :return_date, :source, :start_time,
                  :timezone, :travellers, :type, :updated_at, :vamoos_id, :version

    def initialize(attrs)
      assign_attributes(attrs)
    end

    class << self
      def create!(reference_code, attrs)
        result = post_json("/itinerary/%<operator_code>s/#{reference_code}",
                           { body: attrs.to_json })

        new(result.parsed_response)
      end

      def find!(reference_code)
        result = get_json("/itinerary/%<operator_code>s/#{reference_code}")

        new(result.parsed_response)
      end
    end

    def update!(attrs)
      attrs = updatable_attributes.deep_symbolize_keys.deep_merge(attrs).deep_blank_compact
      result = Vamoos::Itinerary.post_json("/itinerary/%<operator_code>s/#{reference_code}",
                                           { body: attrs.to_json })

      assign_attributes(result.parsed_response)
    end

    def save!
      attrs = updatable_attributes.deep_symbolize_keys.deep_blank_compact
      result = Vamoos::Itinerary.post_json("/itinerary/%<operator_code>s/#{reference_code}",
                                           { body: attrs.to_json })
      assign_attributes(result.parsed_response)
    end

    private

    def updatable_attributes
      { details: details_attributes,
        directories: directories_attributes,
        documents: documents_attributes,
        features: features_attributes,
        locations: locations_attributes,
        meta: meta_attributes,
        notifications: notifications_attributes,
        passcode_groups: passcode_groups_attributes,
        pois: pois_attributes,
        travellers: travellers_attributes }.merge(base_attributes)
    end
  end
end
