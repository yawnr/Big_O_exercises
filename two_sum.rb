def bad_two_sum?(array, target)
  array.each_with_index do |el, index1|
    array[index1 + 1..-1].each_with_index do 
  end
end

array = [0, 1, 5, 7]
p bad_two_sum?(array, 6) # => should be true
p bad_two_sum?(array, 10) # => should be false
