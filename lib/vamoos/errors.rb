# frozen_string_literal: true

module Vamoos
  module Errors
    class VamoosError < StandardError
      attr_reader :data

      def initialize(data)
        @data = data
        super
      end
    end

    class UnauthorizedError < VamoosError; end

    class BadRequestError < VamoosError; end

    class AccessDeniedError < VamoosError; end

    class NotFoundError < VamoosError; end

    class InternalError < VamoosError; end

    class UnavailableError < VamoosError; end

    class MissingCredentialsError < VamoosError; end
  end
end
