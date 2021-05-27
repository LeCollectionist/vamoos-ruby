# frozen_string_literal: true

RSpec.describe Vamoos do
  describe '#configure' do
    before do
      described_class.configure do |config|
        config.token = 'token'
        config.operator_code = 'operator_code'
      end
    end

    it 'sets token' do
      expect(described_class.token).to eq 'token'
    end

    it 'sets operator_code' do
      expect(described_class.operator_code).to eq 'operator_code'
    end
  end
end
