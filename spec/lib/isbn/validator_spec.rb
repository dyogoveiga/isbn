require 'rails_helper'

describe Isbn::Validator do
  describe '.valid?' do
    context 'verify if a isbn number is valid' do
      it 'and return true' do
        expect(Isbn::Validator.valid?('9780143007234')).to eql(true)
      end

      it 'and return false' do
        expect(Isbn::Validator.valid?('9780143007233')).to eql(false)
      end

      it 'and raise exception when isbn size number is invalid' do
        expect { Isbn::Validator.valid?('') }.to raise_error(ArgumentError)
      end
    end
  end
end
