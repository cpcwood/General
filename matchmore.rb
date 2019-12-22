def matchmore(string)
  n = 0
  until string =~ (/[a-z]/, n) == nil
    puts string.match(/[a-z]/, n)
    n = string.match(/[a-z]/, n)
  end
end
