# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Notifications do
  let(:itinerary) { Vamoos::Itinerary.find!(1) }
  let(:attributes) do
    [{
      template_id: 0,
      type: 'gps',
      tag: 0,
      content: 'string',
      url: 'string',
      location_id: 0,
      location_internal_id: 0,
      inspiration_id: 0,
      inspiration_vamoos_id: 0,
      start_at: 'string',
      end_at: '2019-08-24T14:15:22Z',
      delivery_at_relative_to: 'string',
      delivery_at_days: 0,
      delivery_at: '2019-08-24T14:15:22Z',
      latitude: -90,
      longitude: -180,
      is_active: true
    }]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#notifications_attributes' do
    it do
      expect(itinerary.notifications_attributes).to eq(attributes)
    end
  end
end
