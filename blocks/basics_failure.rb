def a_method(a, b)
  a + yield(a, b)
end

def b_method
  return yield if block_given?
  'no block'
end

p a_method(1, 2) { |x, y| (x + y) * 3 }
p b_method
p b_method { "here's a block!" }