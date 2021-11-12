# frozen_string_literal: true

RSpec.describe Vamoos::Helpers::Attributes do
  describe '#assign_attributes' do
    let(:itinerary) { Vamoos::Itinerary.new({ field1: :value }) }

    before do
    end

    context 'with correct attributes' do
      it do
        itinerary.assign_attributes({ field1: :another_value })

        expect(itinerary.field1).to eq(:another_value)
      end
    end

    context 'with empty attributes' do
      it do
        itinerary.assign_attributes({ field1: nil })

        expect(itinerary.field1).to eq(nil)
      end
    end

    context 'with incorrect attributes' do
      it do
        itinerary.assign_attributes({ key: :another_value })

        expect(itinerary.properties).to eq({ key: :another_value })
      end
    end
  end
end
