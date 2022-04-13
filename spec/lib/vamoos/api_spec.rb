# frozen_string_literal: true

RSpec.describe Vamoos::Api do
  let(:response) { instance_double('HTTParty::Response') }
  let(:path) { '/some/path' }
  let(:operator_code) { 'operator_code' }

  %w[get post put delete].each do |method|
    describe "##{method}_json" do
      before do
        Helpers::Authentication.configure_authentication

        allow(described_class).to receive(:send).with(method,
                                                      'https://live.vamoos.com/v3/some/path',
                                                      {
                                                        headers: {
                                                          'content-type' => 'application/json',
                                                          'x-operator-code' => operator_code,
                                                          'x-user-access-token' => 'token'
                                                        }
                                                      }).and_return(response)

        allow(response).to receive(:success?).and_return(true)
      end

      it 'returns the parsed response from the request' do
        result = described_class.public_send("#{method}_json", operator_code, path)

        expect(result).to eq(response)
      end
    end
  end

  describe '#raise_errors' do
    errors = {
      400 => Vamoos::Errors::BadRequestError,
      401 => Vamoos::Errors::UnauthorizedError,
      403 => Vamoos::Errors::AccessDeniedError,
      404 => Vamoos::Errors::NotFoundError,
      405 => Vamoos::Errors::MethodNotAllowedError,
      500 => Vamoos::Errors::InternalError,
      502 => Vamoos::Errors::UnavailableError,
      503 => Vamoos::Errors::UnavailableError
    }

    errors.each do |code, error|
      context "when #{code} is returned" do
        before do
          Helpers::Authentication.configure_authentication

          allow(described_class).to receive(:send).with('get',
                                                        'https://live.vamoos.com/v3/some/path',
                                                        {
                                                          headers: {
                                                            'content-type' => 'application/json',
                                                            'x-operator-code' => operator_code,
                                                            'x-user-access-token' => 'token'
                                                          }
                                                        }).and_return(response)

          allow(response).to receive(:success?).and_return(false)
          allow(response).to receive(:code).and_return(code)
          allow(response).to receive(:parsed_response)
            .and_return({ 'status' => 'error', 'error' => error.to_s })
        end

        it "raise #{error}" do
          expect { described_class.public_send(:get_json, operator_code, path) }
            .to raise_error(error)
        end
      end
    end
  end
end
