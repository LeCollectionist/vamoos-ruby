# frozen_string_literal: true

require 'httparty'

module Vamoos
  class Api
    include ::HTTParty
    include Helpers

    attr_accessor :properties

    VAMOOS_API_URI = 'https://live.vamoos.com/v3'

    class << self
      %w[get post put delete].each do |method|
        define_method "#{method}_json" do |operator_code, path, options = {}|
          options[:headers] ||= {}
          options[:headers].merge!(authorization_header(operator_code))
          options[:headers].merge!(content_type_header)

          response = send(method, VAMOOS_API_URI + path, options)
          raise_errors(response) unless response.success?

          response
        end
      end

      private

      def authorization_header(operator_code)
        if Vamoos.token.nil?
          raise Vamoos::Errors::MissingCredentialsError,
                'Please provide Vamoos user access token'
        end

        { 'x-user-access-token' => Vamoos.token, 'x-operator-code' => operator_code }
      end

      def content_type_header
        { 'content-type' => 'application/json' }
      end

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
      def raise_errors(response)
        data = response.parsed_response
        error = "#{data['status']}: #{data['error']}"

        case response.code.to_i
        when 400
          raise Vamoos::Errors::BadRequestError.new(data), error
        when 401
          raise Vamoos::Errors::UnauthorizedError.new(data), error
        when 403
          raise Vamoos::Errors::AccessDeniedError.new(data), error
        when 404
          raise Vamoos::Errors::NotFoundError.new(data), error
        when 405
          raise Vamoos::Errors::MethodNotAllowedError.new(data), error
        when 500
          raise Vamoos::Errors::InternalError.new(data), error
        when 502..503
          raise Vamoos::Errors::UnavailableError.new(data), error
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
    end
  end
end
