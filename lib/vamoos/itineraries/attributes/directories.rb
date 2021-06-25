# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Directories
        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def directories_attributes
          directories&.map do |directory|
            {
              type: directory[:type],
              name: directory[:name],
              tag: directory[:tag],
              content: directory[:content],
              is_list: directory[:is_list],
              background: attachment(directory[:background]),
              video: attachment(directory[:video]),
              starts_at: directory[:starts_at],
              ends_at: directory[:ends_at],
              is_enabled: directory[:is_enabled],
              weekdays: {
                monday: directory.dig(:weekdays, :monday),
                tuesday: directory.dig(:weekdays, :tuesday),
                wednesday: directory.dig(:weekdays, :wednesday),
                thursday: directory.dig(:weekdays, :thursday),
                friday: directory.dig(:weekdays, :friday),
                saturday: directory.dig(:weekdays, :saturday),
                sunday: directory.dig(:weekdays, :sunday)
              },
              actions: directory[:actions]&.map { |action| attachment(action) },
              # Voir comment faire la creation recursive ici...
              children: directory[:children]&.map { |_child| {} }
            }
          end
          # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
        end
      end
    end
  end
end
