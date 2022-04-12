# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Routings do
  let(:itinerary) { Vamoos::Itinerary.find!('operator_code', 1) }
  let(:attributes) do
    { master: '/itinerary/myop/myref/languages/en',
      fallback: '/itinerary/myop/myref/languages/en',
      this: '/itinerary/myop/myref/languages/fr',
      language: { en: '/itinerary/myop/myref/languages/en',
                  fr: '/itinerary/myop/myref/languages/fr',
                  ja: '/itinerary/myop/myref/languages/ja' } }
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#routings_attributes' do
    it do
      expect(itinerary.routings_attributes).to eq(attributes)
    end
  end
end
