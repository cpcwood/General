require 'rspec_double_test'

describe Tester do
  it 'prints page of book' do
    book = double("foo", :page => 14)
    book = double(14, :page => 14)
    p book
    expect(subject.test(book)).to eq('page no. 14')
  end
end
