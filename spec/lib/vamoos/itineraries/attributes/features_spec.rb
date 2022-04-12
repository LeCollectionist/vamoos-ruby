# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Features do
  let(:itinerary) { Vamoos::Itinerary.find!('operator_code', 1) }
  let(:attributes) do
    [
      {
        count: 0,
        feature_group_id: 0,
        icon_https_url: 'string',
        id: 0,
        is_active: true,
        is_featured: false,
        name: 'string',
        updated_at: '2019-08-24T14:15:22Z',
        created_at: '2019-08-24T14:15:22Z'
      }
    ]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#features_attributes' do
    it do
      expect(itinerary.features_attributes).to eq(attributes)
    end
  end
end
