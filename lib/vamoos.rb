# frozen_string_literal: true

require_relative 'vamoos/api'

module Vamoos
  class << self
    attr_accessor :token, :operator_code

    def configure
      yield self

      true
    end
  end
end
