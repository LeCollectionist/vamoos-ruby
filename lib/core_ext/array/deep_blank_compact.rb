# frozen_string_literal: true

class Array
  def deep_blank_compact
    r = map do |element|
      if element.respond_to?(:deep_blank_compact)
        element.deep_blank_compact
      else
        element
      end
    end

    r = r.reject { |value| [nil, '', [], {}].include?(value) }

    r.blank? ? nil : r
  end
end
