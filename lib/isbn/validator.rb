module Isbn
  # nodoc:
  class Validator
    ISBN_SIZE = 13

    class InvalidArgumentError < StandardError; end

    def self.valid?(number)
      raise Isbn::InvalidArgumentError if number.to_s.size != ISBN_SIZE

      number[-1] == Isbn::Generator.generate(number[0..11])[-1]
    end
  end
end
