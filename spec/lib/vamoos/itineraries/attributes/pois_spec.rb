# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Pois do
  let(:itinerary) { Vamoos::Itinerary.find!('operator_code', 1) }
  let(:attributes) do
    [{
      id: 0,
      is_on: true
    }]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#pois_attributes' do
    it do
      expect(itinerary.pois_attributes).to eq(attributes)
    end
  end
end
