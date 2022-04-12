# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::Directories do
  let(:itinerary) { Vamoos::Itinerary.find!('operator_code', 1) }
  let(:attributes) do
    [{
      type: 'directory',
      name: 'string',
      tag: 0,
      content: 'string',
      is_list: true,
      background: { icon_id: 0, name: 'string', web_url: 'string' },
      video: { icon_id: 0, name: 'string', web_url: 'string' },
      starts_at: '2019-08-24T14:15:22Z',
      ends_at: '2019-08-24T14:15:22Z',
      is_enabled: true,
      weekdays: {
        monday: false,
        tuesday: false,
        wednesday: false,
        thursday: false,
        friday: false,
        saturday: false,
        sunday: false
      },
      actions: [{ icon_id: 0, name: 'string', web_url: 'string' }],
      children: [{}]
    }]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#directories_attributes' do
    it do
      expect(itinerary.directories_attributes).to eq(attributes)
    end
  end
end
