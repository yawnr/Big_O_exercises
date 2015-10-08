def windowed_max_range(array, window_size)
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


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyStack

attr_reader :min, :max

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
    @max_list.peek
  end

  def min
    @min_list.peek
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

class StackQueue

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


a = StackQueue.new
a.enqueue(1)
a.enqueue(2)
a.enqueue(3)
p a

a.dequeue
a.enqueue(5)
p a
