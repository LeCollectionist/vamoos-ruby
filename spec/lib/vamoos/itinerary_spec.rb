# frozen_string_literal: true

RSpec.describe Vamoos::Itinerary do
  before { Helpers::Authentication.configure_authentication }

  describe '#create!' do
    it 'returns Vamoos Itinerary' do
      itinerary = described_class.create_or_update!('reference_code', { key: 'value' })

      expect(itinerary.id).to\
        be_an_instance_of(Integer)
    end
  end
end
