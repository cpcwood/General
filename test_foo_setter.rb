class Foo
  def foo=(x)
    puts "OK: x=#{x}"
  end
end

f = Foo.new
f.foo = 123
