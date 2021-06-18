# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Details do
  let(:itinerary) { Vamoos::Itinerary.find!(1) }
  let(:attributes) do
    [{ headline: 'string',
       tag: 0,
       content: 'string',
       position: 0,
       location_internal_id: 0,
       meta: {},
       documents: [{ icon_id: 0, name: 'string', web_url: 'string' }],
       image: { icon_id: 0, name: 'string', web_url: 'string' } }]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#details_attributes' do
    it do
      expect(itinerary.details_attributes).to eq(attributes)
    end
  end
end
