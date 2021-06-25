# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Locations do
  let(:itinerary) { Vamoos::Itinerary.find!(1) }
  let(:attributes) do
    [{
      country: 'string',
      country_iso: 'string',
      description: 'string',
      internal_id: 0,
      latitude: -90,
      longitude: -180,
      location: 'string',
      meta: {},
      name: 'string',
      on_maps: true,
      on_weather: true,
      position: 0,
      icon_id: 0,
      tag: 0,
      vamoos_id: nil,
      file: { icon_id: 0, name: 'string', web_url: 'string' }
    }]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#locations_attributes' do
    it do
      expect(itinerary.locations_attributes).to eq(attributes)
    end
  end
end
