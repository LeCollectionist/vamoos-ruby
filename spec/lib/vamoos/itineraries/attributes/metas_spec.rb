# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Metas do
  let(:itinerary) { Vamoos::Itinerary.find!('operator_code', 1) }
  let(:attributes) do
    {
      show_journal: '0',
      show_days: '0',
      show_story_board_daily: '0',
      show_story_board_summary: '0',
      show_poi_list: '0',
      show_directory: 'always',
      show_vouchers: 'always',
      show_daily_activities: 'always',
      show_messaging: 'string',
      show_dnd: 'during',
      dnd_contact_email: 'string',
      dnd_cut_off_time: 'string',
      dnd_warning_message: 'string',
      require_personal_details: '0',
      messaging_email_during: 'string',
      messaging_email_before_after: 'string',
      messaging_email_during_days_before: 'string',
      messaging_email_during_days_after: 'string',
      download_counter: 'string',
      travel_documents_label: 'string',
      destination_documents_label: 'string',
      travel_documents_icon_id: 'string',
      destination_documents_icon_id: 'string',
      daily_activities_days: 7,
      home_screen_description: 'string',
      address: 'string',
      latitude: 'string',
      longitude: 'string',
      telephone: 'string',
      email: 'string',
      alert_emails: ['string'],
      alert_email_admins: true,
      website: 'string',
      twitter: 'string',
      facebook: 'string',
      short_description: 'string',
      long_description: 'string',
      number_of_rooms: 'string',
      hotel_info_label: 'string',
      hotel_info_icon_id: 'string',
      check_in_time: 'string'
    }
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#meta_attributes' do
    it do
      expect(itinerary.meta_attributes).to eq(attributes)
    end
  end
end
