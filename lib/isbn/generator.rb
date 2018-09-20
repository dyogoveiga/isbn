module Isbn
  # nodoc:
  class Generator
    ISBN_BASE_SIZE = 12
    DIVIDER_NUMBER = 10

    class InvalidArgumentError < StandardError; end

    def self.generate(number)
      raise InvalidArgumentError if number.to_s.size != ISBN_BASE_SIZE

      result = number.split('').map(&:to_i).each_with_index.map do |value, index|
        value * (index.even? ? 1 : 3)
      end.reduce(:+) % DIVIDER_NUMBER

      check_digit = DIVIDER_NUMBER - result
      check_digit = check_digit.eql?(10) ? 0 : check_digit
      "#{number}#{check_digit}"
    end
  end
end
