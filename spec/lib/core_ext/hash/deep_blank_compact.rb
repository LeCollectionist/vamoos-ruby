# frozen_string_literal: true

RSpec.describe Hash do
  describe '#deep_blank_compact' do
    context 'with empty hash' do
      it { expect({ key: {} }.deep_blank_compact).to eq(nil) }
    end

    context 'with nested empty hash value' do
      it { expect({ key: { subkey: nil } }.deep_blank_compact).to eq(nil) }

      it do
        expect({ key: { subkey: [] } }.deep_blank_compact).to eq(nil)
      end
    end

    context 'with nested non-empty hash value' do
      it do
        expect({ key: { subkey: :value } }.deep_blank_compact).to eq({ key: { subkey: :value } })
      end

      it do
        expect({ key: { subkey: [:value] } }.deep_blank_compact).to\
          eq({ key: { subkey: [:value] } })
      end
    end
  end
end
