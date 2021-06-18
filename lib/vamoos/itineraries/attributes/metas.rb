# frozen_string_literal: true

module Vamoos
  module Itineraries
    module Attributes
      module Metas
        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def meta_attributes
          return if meta.blank?

          {
            show_journal: meta[:show_journal],
            show_days: meta[:show_days],
            show_story_board_daily: meta[:show_story_board_daily],
            show_story_board_summary: meta[:show_story_board_summary],
            show_poi_list: meta[:show_poi_list],
            show_directory: meta[:show_directory],
            show_vouchers: meta[:show_vouchers],
            show_daily_activities: meta[:show_daily_activities],
            show_messaging: meta[:show_messaging],
            show_dnd: meta[:show_dnd],
            dnd_contact_email: meta[:dnd_contact_email],
            dnd_cut_off_time: meta[:dnd_cut_off_time],
            dnd_warning_message: meta[:dnd_warning_message],
            require_personal_details: meta[:require_personal_details],
            messaging_email_during: meta[:messaging_email_during],
            messaging_email_before_after: meta[:messaging_email_before_after],
            messaging_email_during_days_before: meta[:messaging_email_during_days_before],
            messaging_email_during_days_after: meta[:messaging_email_during_days_after],
            download_counter: meta[:download_counter],
            travel_documents_label: meta[:travel_documents_label],
            destination_documents_label: meta[:destination_documents_label],
            travel_documents_icon_id: meta[:travel_documents_icon_id],
            destination_documents_icon_id: meta[:destination_documents_icon_id],
            daily_activities_days: meta[:daily_activities_days],
            home_screen_description: meta[:home_screen_description],
            address: meta[:address],
            latitude: meta[:latitude],
            longitude: meta[:longitude],
            telephone: meta[:telephone],
            email: meta[:email],
            alert_emails: meta[:alert_emails],
            alert_email_admins: meta[:alert_email_admins],
            website: meta[:website],
            twitter: meta[:twitter],
            facebook: meta[:facebook],
            short_description: meta[:short_description],
            long_description: meta[:long_description],
            number_of_rooms: meta[:number_of_rooms],
            hotel_info_label: meta[:hotel_info_label],
            hotel_info_icon_id: meta[:hotel_info_icon_id],
            check_in_time: meta[:check_in_time]
          }
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
      end
    end
  end
end
