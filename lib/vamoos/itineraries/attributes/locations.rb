# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Locations
        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def locations_attributes
          locations&.map do |location|
            {
              tag: location[:tag],
              name: location[:name],
              location: location[:location],
              latitude: location[:latitude],
              longitude: location[:longitude],
              position: location[:position],
              description: location[:description],
              country: location[:country],
              country_iso: location[:country_iso],
              icon_id: location[:icon_id],
              file: location_attachment(location),
              internal_id: location[:id],
              vamoos_id: nil, # D'ou sors ce champ ?
              on_weather: location[:on_weather],
              on_maps: location[:on_maps],
              meta: location[:meta] # C'est un objet et y'a pas ecrit ce qu'il y a dedans
            }
          end
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

        private

        def location_attachment(location)
          {
            name: location.dig(:library_node, :name),
            icon_id: location.dig(:library_node, :icon_id)
          }.merge(location_attachment_file(location))
        end

        # rubocop:disable Metrics/MethodLength
        def location_attachment_file(location)
          file = [
            {
              library_node_id: location.dig(:library_node, :id),
              is_public: location.dig(:library_node, :is_public)
            },
            {
              file_url: location.dig(:library_node, :file, :https_url),
              is_public: location.dig(:library_node, :file, :is_public)
            },
            {
              file_id: location.dig(:library_node, :file, :id),
              is_public: location.dig(:library_node, :file, :is_public)
            },
            {
              web_url: location.dig(:library_node, :remote_url)
            }
          ].select { |h| h.values.all? }.last

          file || {}
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
