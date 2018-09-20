module Isbn
  # nodoc:
  class Validator
    ISBN_SIZE = 13

    def self.valid?(number)
      raise ArgumentError if number.to_s.size != ISBN_SIZE

      number[-1] == Isbn::Generator.generate(number[0..11])[-1]
    end
  end
end
