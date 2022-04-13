# frozen_string_literal: true

RSpec.describe Vamoos::Itineraries::Attributes::PasscodeGroups do
  let(:itinerary) { Vamoos::Itinerary.find!('operator_code', 1) }
  let(:attributes) do
    [
      {
        name: 'string',
        passcodes: [
          {
            passcode: 'string',
            description: 'string'
          }
        ],
        display_rules: {
          show_directory: {
            show_directory: 'always',
            show_documents: 'always',
            show_messaging: 'always',
            show_daily: 'always',
            show_dnd: 'during',
            show_vouchers: 'always'
          },
          show_daily: nil,
          show_dnd: nil,
          show_documents: nil,
          show_messaging: nil,
          show_vouchers: nil
        }
      }
    ]
  end

  before { Helpers::Authentication.configure_authentication }

  describe '#passcode_groups_attributes' do
    it do
      expect(itinerary.passcode_groups_attributes).to eq(attributes)
    end
  end
end
