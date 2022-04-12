# frozen_string_literal: true

RSpec.describe Vamoos::Itinerary do
  before { Helpers::Authentication.configure_authentication }

  describe '#create!' do
    it 'returns Vamoos Itinerary' do
      itinerary = described_class.create!('operator_code', 'reference_code', { key: 'value' })

      expect(itinerary.id).to be_an_instance_of(Integer)
    end
  end

  describe '#find!' do
    it 'returns Vamoos Itinerary' do
      itinerary = described_class.find!('operator_code', 'reference_code')

      expect(itinerary.id).to be_an_instance_of(Integer)
    end
  end

  describe '#update!' do
    it 'returns updated Vamoos Itinerary' do
      itinerary = described_class.find!('operator_code', 'reference_code')
      itinerary.update!(field1: 'string')

      expect(itinerary.field1).to eq('string')
    end
  end

  describe '#save!' do
    it 'returns updated Vamoos Itinerary' do
      itinerary = described_class.find!('operator_code', 'reference_code')
      itinerary.field1 = 'string'

      itinerary.save!

      expect(itinerary.field1).to eq('string')
    end
  end
end
