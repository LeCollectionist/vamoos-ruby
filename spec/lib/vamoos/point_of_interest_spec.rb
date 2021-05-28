# frozen_string_literal: true

RSpec.describe Vamoos::PointOfInterest do
  before { Helpers::Authentication.configure_authentication }

  describe '#create!' do
    it 'returns Vamoos Poi' do
      poi = described_class.create!({ key: 'value' })

      expect(poi.id).to\
        be_an_instance_of(Integer)
    end
  end

  describe '#update!' do
    it 'returns Vamoos Poi' do
      poi = described_class.update!(5_827_354, { key: 'value' })

      expect(poi.id).to\
        be_an_instance_of(Integer)
    end
  end
end
