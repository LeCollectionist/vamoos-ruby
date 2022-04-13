# frozen_string_literal: true

RSpec.describe Vamoos do
  describe '#configure' do
    before do
      described_class.configure do |config|
        config.token = 'token'
      end
    end

    it 'sets token' do
      expect(described_class.token).to eq 'token'
    end
  end
end
