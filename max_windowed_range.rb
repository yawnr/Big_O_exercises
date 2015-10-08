def bad_windowed_max_range(array, window_size)
  i = 0
  current_max_range = 0

  while i <= array.length - window_size
    range = array[i...i + window_size]
    if range.max - range.min > current_max_range
      current_max_range = range.max - range.min
    end

    i += 1
  end

  current_max_range
end

# O(n ** 2)


# p bad_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p bad_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p bad_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p bad_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyStack

attr_reader :min, :max, :store

  def initialize
    @store = []
    @min_list = []
    @max_list = []
  end

  def pop
    last_el = @store.pop

    @max_list.pop if !max.nil? && max == last_el
    @min_list.pop if !min.nil? && min == last_el

    last_el
  end

  def push(el)
    @max_list << el if max.nil? || el >= max
    @min_list << el if min.nil? || el <= min

    @store.concat([el])
  end

  def max
    @max_list[-1]
  end

  def min
    @min_list[-1]
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store[0].nil?
  end

end

# Checking if our MyStack works
# a = MyStack.new
# p a.store
# puts
# a.push(3)
# p a.store
# p a.max
# p a.min
# puts
# a.push(2)
# p a.store
# p a.max
# p a.min
# puts
# a.push(6)
# p a.store
# p a.max
# p a.min
# puts
# a.push(-1)
# p a.store
# p a.max
# p a.min
# puts
# a.pop
# p a.store
# p a.max
# p a.min



class StackQueue < MyStack

  attr_accessor :queue

 def initialize
   @queue = MyStack.new
 end

 def enqueue(el)
   @queue.push(el)
 end

 def dequeue
   hold_stack = MyStack.new

   (@queue.size - 1).times do
     hold_stack.push(@queue.pop)
   end

   first_el = @queue.pop

   hold_stack.size.times do
     @queue.push(hold_stack.pop)
  end

  first_el
 end

 def max
   @queue.max
 end

 def min
   @queue.min
 end

 def size
   size = 0
   @queue.each do |el|
     size += 1
   end
   size
 end

 def empty?
   @queue.empty?
 end

end

class MinMaxStackQueue < StackQueue

  def initialize
    super
  end

  def max
    @queue.max
  end

  def min
    @queue.min
  end

end

#Checking if our StackQueue works
# a = MinMaxStackQueue.new
# a.enqueue(1)
# a.enqueue(7)
# a.enqueue(3)
# puts a.max
# puts a.min
# puts
#
# puts "then we dequeue"
#
# a.dequeue
# puts a.max
# puts a.min
# puts
#
# puts "then we enqueue 5"
# a.enqueue(5)
# puts a.max
# puts a.min

def windowed_max_range(array, window_size)
  queue = MinMaxStackQueue.new

  array[0...window_size].each do |el|
    queue.enqueue(el)
  end

  current_max_range = queue.max - queue.min

  (window_size...array.length).each do |i|
    queue.enqueue(array[i])
    queue.dequeue

    current_max_range = queue.max - queue.min if current_max_range < queue.max - queue.min
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
