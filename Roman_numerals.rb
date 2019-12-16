def from_roman(string)
  numerals = {"X" => 10, "IX" => 9, "V" => 5, "IV" => 4, "I" => 1}
  pattern = Regexp.union(numerals.keys)
  p string.scan(pattern).inject() {|sum, n| sum += numerals[n]}

  # a =  numerals.detect{|k,v|
  #   p k
  #   p v
  #
  #   string.gsub!(/#{k}/, '')
  # }
  # p string
  # p a
  # # p string
end

from_roman("XIV")

#Converting string numerals to number
#for each section of numerals string, the element should be matched and converted into a number, then added to the total

#RSpec test
#
# describe 'converts numerals to integer' do
#   expect(from_roman('X')).to eq 10
# end
#
# describe 'converts numerals to integer' do
#   expect(from_roman('IX')).to eq 9
# end
