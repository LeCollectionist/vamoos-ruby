# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Travellers do
  let(:itinerary) { Vamoos::Itinerary.find!(1) }
  let(:attributes) do
    [{
      name: 'string',
      friendly_name: 'string',
      details: {},
      tag: 0
    }]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#travellers_attributes' do
    it do
      expect(itinerary.travellers_attributes).to eq(attributes)
    end
  end
end
