require_relative 'integer'

class String
  ROMAN_TO_INT = Integer::ROMAN_CONV.map{ |k,v| [v, k] }.to_h

  def roman_to_int
    roman = self
    numbers = roman.chars.map { |char| ROMAN_TO_INT[char] }.reverse
    numbers.inject([0, 1]) do |result_number, int|
      result, number = result_number
      int >= number ? [result + int, int] : [result - int, number]
    end.first
  end
end
