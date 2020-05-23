kurwy = "abc"

def fun1(atr1, atr2)
  fun2(atr1)
end

def fun2(atr1)
  print atr1
end

10.times do
  print fun1(kurwy, "y")
end
