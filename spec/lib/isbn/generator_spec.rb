require 'rails_helper'

describe Isbn::Generator do
  describe '.generate' do
    context 'generate a isbn number' do
      it 'with success' do
        expect(Isbn::Generator.generate('978014300723')).to eql('9780143007234')
      end

      it 'and raise exception when isbn size number is invalid' do
        expect { Isbn::Generator.generate('') }.to raise_error(ArgumentError)
      end
    end
  end
end
