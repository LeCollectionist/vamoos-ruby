# frozen_string_literal: true

require_relative 'vamoos/api'
require_relative 'vamoos/itinerary'
require_relative 'vamoos/point_of_interest'

module Vamoos
  class << self
    attr_accessor :token, :operator_code

    def configure
      yield self

      true
    end
  end
end
