# frozen_string_literal: true

RSpec.describe Vamoos::Api do
  let(:body) { { key: 'value' } }
  let(:path) { '/some/path' }

  %w[get post put delete].each do |method|
    describe "##{method}_json" do
      before do
        Helpers::Authentication.configure_authentication

        allow(described_class).to receive(:send).with(
          method,
          'https://live.vamoos.com/v3/some/path',
          {
            headers: {
              'content-type' => 'application/json',
              'x-operator-code' => 'operator_code',
              'x-user-access-token' => 'token'
            }
          }
        ).and_return(body)
      end

      it 'returns the parsed response from the request' do
        result = described_class.public_send("#{method}_json", path)

        expect(result).to eq({ key: 'value' })
      end
    end
  end
end
