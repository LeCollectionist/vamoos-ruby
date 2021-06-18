# frozen_string_literal: true

RSpec.describe Array do
  describe '#deep_blank_compact' do
    context 'with nested empty hash' do
      it { expect([{}].deep_blank_compact).to eq(nil) }
    end

    context 'with nested empty hash value' do
      it { expect([{ key: nil }].deep_blank_compact).to eq(nil) }
    end

    context 'with nested non-empty hash value' do
      it { expect([{ key: :value }].deep_blank_compact).to eq([{ key: :value }]) }
    end

    context 'with nested empty array' do
      it { expect([[]].deep_blank_compact).to eq(nil) }
    end

    context 'with nested non-empty array' do
      it { expect([[:value]].deep_blank_compact).to eq([[:value]]) }

      context 'with nested empty hash' do
        it { expect([[{}]].deep_blank_compact).to eq(nil) }
      end

      context 'with nested non-empty hash' do
        it { expect([[{ key: :value }]].deep_blank_compact).to eq([[{ key: :value }]]) }
      end
    end
  end
end
