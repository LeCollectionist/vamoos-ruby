# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Notifications
        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def notifications_attributes
          notifications&.map do |notification|
            {
              template_id: notification[:template_id],
              type: notification[:type],
              tag: notification[:tag],
              content: notification[:content],
              url: notification[:url],
              location_id: notification[:location_id],
              location_internal_id: notification[:location_internal_id],
              inspiration_id: notification[:inspiration_id],
              inspiration_vamoos_id: notification[:inspiration_vamoos_id],
              start_at: notification[:start_at],
              end_at: notification[:end_at],
              delivery_at_relative_to: notification[:delivery_at_relative_to],
              delivery_at_days: notification[:delivery_at_days],
              delivery_at: notification[:delivery_at],
              latitude: notification[:latitude],
              longitude: notification[:longitude],
              is_active: notification[:is_active]
            }
          end
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
      end
    end
  end
end
