# frozen_string_literal: true

require_relative 'vamoos/api'
require_relative 'vamoos/itinerary'

module Vamoos
  class << self
    attr_accessor :token, :operator_code

    def configure
      yield self

      true
    end
  end
end
