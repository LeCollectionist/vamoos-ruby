# frozen_string_literal: true

require 'httparty'

module Vamoos
  class Api
    include ::HTTParty
    VAMOOS_API_URI = 'https://live.vamoos.com/v3'

    class << self
      %w[get post put delete].each do |method|
        define_method "#{method}_json" do |path, options = {}|
          options[:headers] ||= {}
          options[:headers].merge!(authorization_header)
          options[:headers].merge!(content_type_header)

          path = Kernel.format(path, operator_code: Vamoos.operator_code)

          send(method, VAMOOS_API_URI + path, options)
        end
      end

      private

      def authorization_header
        if Vamoos.token.nil? || Vamoos.operator_code.nil?
          raise Error::MissingCredentials,
                'Please provide Vamoos user access token and operator code'
        end

        { 'x-user-access-token' => Vamoos.token, 'x-operator-code' => Vamoos.operator_code }
      end

      def content_type_header
        { 'content-type' => 'application/json' }
      end
    end
  end
end
