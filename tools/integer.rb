ROMAN_CONV = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}
class Integer

  # SOURCE: https://stackoverflow.com/a/26103503
  def to_roman
    remaining = self
    empty_string = ""

    ROMAN_CONV.inject(empty_string) { |result, (arab, roman)|
      whole_part, remaining = remaining.divmod(arab)
      result << roman * whole_part
    }
  end
end