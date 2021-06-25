# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module PasscodeGroups
        # rubocop:disable Metrics/MethodLength
        def passcode_groups_attributes
          passcode_groups&.map do |passcode_group|
            {
              name: passcode_group[:name],
              passcodes: passcode_group[:passcodes]&.map do |passcode|
                {
                  passcode: passcode[:passcode],
                  description: passcode[:description]
                }
              end,
              display_rules: {
                show_directory: passcode_group[:display_rules],
                show_documents: passcode_group[:show_documents],
                show_messaging: passcode_group[:show_messaging],
                show_daily: passcode_group[:show_daily],
                show_dnd: passcode_group[:show_dnd],
                show_vouchers: passcode_group[:show_vouchers]
              }
            }
          end
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
