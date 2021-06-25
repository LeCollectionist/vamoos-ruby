# frozen_string_literal: true

class Hash
  def deep_blank_compact
    obj = reject { |_, value| [nil, '', [], {}].include?(value) }

    obj = obj.each_key do |key|
      next unless obj[key].respond_to?(:deep_blank_compact)

      obj[key] = obj[key].deep_blank_compact
    end

    if obj.blank? || obj.values.all?(&:blank?)
      nil
    else
      obj.reject { |_, value| [nil, '', [], {}].include?(value) }
    end
  end
end
