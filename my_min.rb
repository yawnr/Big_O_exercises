def my_min(array)
  min = array.first

  array.each_index do |i|
    until i == array.length - 1
      if array[i + 1] < min
        min = array[i + 1]
      end
      i += 1
    end
  end

  min
end

#O(n ** 2)

def my_min2(array)
  min = array.first

  array.each do |el|
    min = el if el < min
  end

  min
end

#O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5


def sub_sum(list)
  subs = []

  for i in 0...list.length
    for j in i...list.length
      subs << list[i..j]
    end
  end

  max = list.first

  subs.each do |subarray|
    sum = subarray.inject(:+)
    max = sum if sum > max
  end

  max
end

#O(n ** 2)

# list = [5, 3, -7]
# p sub_sum(list) # => 8

def sub_sum_n(list)
  max_sum = 0
  sum = 0
  current_sum = 0

  list.each do |el|
    current_sum += el
    if current_sum < 0
      max_sum = sum if sum > max_sum
      sum = 0
      current_sum = 0
    else
      sum += el
      max_sum = sum if sum > max_sum
    end
  end

  max_sum
end

list = [5, 3, -9, 6, 1, -1, 3, 5, -4]
p sub_sum_n(list) # => 8
