# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Base do
  let(:itinerary) { Vamoos::Itinerary.find!('operator_code', 1) }
  let(:attributes) do
    {
      type: 'string',
      departure_date: '2019-08-24',
      return_date: '2019-08-24',
      timezone: 'string',
      start_time: 'string',
      client_reference: 'string',
      vamoos_id: 0,
      field1: 'string',
      field2: 'string',
      field3: 'string',
      field4: 'string',
      source: 'string',
      inspiration_vamoos_id: 0,
      is_active: true,
      new_only: false,
      background: { icon_id: 0, name: 'string', web_url: 'string' },
      logo: { icon_id: 0, name: 'string', web_url: 'string' },
      flight_ids: [0]
    }
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#base_attributes' do
    it do
      expect(itinerary.base_attributes).to eq(attributes)
    end
  end
end
