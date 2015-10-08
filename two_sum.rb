

def bad_two_sum?(array, target)
  array.each_with_index do |el, index1|
    array[index1 +  1..-1].each_with_index do |el2 , index2|
      return true if el + el2 == target
    end
  end

  false
end
## O(n ** 2) complexity

# array = [0, 1, 5, 7]
# p bad_two_sum?(array, 6) # => should be true
# p bad_two_sum?(array, 10) # => should be false


def okay_two_sum?(array, target)
  sorted_array = array.sort

  sorted_array.each_with_index do |el, index|
    next if index == array.length - 1
    return true if el + sorted_array[index + 1] == target
    break if el + sorted_array[index + 1] > target
  end

  false
end
## O(n * log(n)) complexity

# array = [0, 1, 5, 7]
# p okay_two_sum?(array, 6) # => should be true
# p okay_two_sum?(array, 10) # => should be false


def good_two_sum?(array, target)
  hash = Hash.new(0)

  array.each do |el|
    hash[el] += 1
  end

  array.each do |el|
    current_target = target - el

    if hash.include?(current_target)
      if target % current_target == 0
        return true if hash[current_target] >= target / current_target
      else
        return true
      end
    end
  end

  false
end

array = [0, 1, 5, 7]
p good_two_sum?(array, 6) # => should be true
p good_two_sum?(array, 10) # => should be false
