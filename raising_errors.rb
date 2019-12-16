# Error exception tests

def raise_and_rescue
  begin
    puts 'I am before the raise.'
    raise 'An error has occurred.'
    puts 'I am after the raise.'
  rescue
    puts 'I am rescued with begin end.'
  end
  puts 'I am after the begin block.'
end
raise_and_rescue
