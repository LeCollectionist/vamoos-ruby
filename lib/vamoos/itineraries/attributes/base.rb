# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Base
        # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        def base_attributes
          { type: type,
            departure_date: departure_date,
            return_date: return_date,
            timezone: timezone,
            start_time: start_time,
            client_reference: client_reference,
            vamoos_id: vamoos_id,
            field1: field1,
            field2: field2,
            field3: field3,
            field4: field4,
            source: source,
            inspiration_vamoos_id: inspiration.try(:fetch, :vamoos_id) || inspiration,
            is_active: is_active,
            new_only: false,
            background: attachment(background),
            logo: attachment(logo),
            flight_ids: flights&.map { |flight| flight[:id] } }
        end
        # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

        private

        def attachment(field)
          return if field.blank?

          {
            name: field[:name],
            icon_id: field[:icon_id]
          }.compact.merge(attachment_file(field))
        end

        def attachment_file(field)
          file = [
            { library_node_id: field.dig(:library_node, :id), is_public: field[:is_public] },
            { file_url: field.dig(:file, :https_url), is_public: field.dig(:file, :is_public) },
            { file_id: field.dig(:file, :id), is_public: field.dig(:file, :is_public) },
            { web_url: field[:remote_url] }
          ].reject { |h| h.values.any?(&:nil?) }.last

          file || {}
        end
      end
    end
  end
end
