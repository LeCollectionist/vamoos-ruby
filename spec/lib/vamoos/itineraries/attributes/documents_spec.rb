# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Documents do
  let(:itinerary) { Vamoos::Itinerary.find!(1) }
  let(:attributes) do
    {
      destination: [{ icon_id: 0, name: 'string', web_url: 'string' }],
      travel: [{ icon_id: 0, name: 'string', web_url: 'string' }]
    }
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#documents_attributes' do
    it do
      expect(itinerary.documents_attributes).to eq(attributes)
    end
  end
end
