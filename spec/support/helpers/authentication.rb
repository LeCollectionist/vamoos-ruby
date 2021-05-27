# frozen_string_literal: true

module Helpers
  module Authentication
    def self.configure_authentication(token: 'token', operator_code: 'operator_code')
      Vamoos.configure do |config|
        config.token = token
        config.operator_code = operator_code
      end
    end
  end
end
