# frozen_string_literal: true

module Helpers
  module Authentication
    def self.configure_authentication(token: 'token')
      Vamoos.configure do |config|
        config.token = token
      end
    end
  end
end
