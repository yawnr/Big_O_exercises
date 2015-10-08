def first_anagram?(word1, word2)
  word1_letters = word1.split("")
  word1_grams = permutations(word1_letters).map(&:join)

  word1_grams.include?(word2)
end
## O(n!)


def permutations(array)
  return array if array.length <= 1
  return [array, array.reverse] if array.length == 2

  permutations_list = []

  array.each_index do |i|
    subarray = array[0...i] + array[i + 1...array.length]
    permutations(subarray).each do |permutation|
      permutations_list << [array[i]] + permutation
    end
  end

  permutations_list
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true


def second_anagram?(word1, word2)
  word1_letters = word1.split("")
  word2_letters = word2.split("")

  check_letters = word1_letters.dup

  check_letters.each do |letter|
    return false if !word2_letters.include?(letter)
    word1_letter_index = word1_letters.find_index(letter)
    word2_letter_index = word2_letters.find_index(letter)
    word1_letters.delete_at(word1_letter_index)
    word2_letters.delete_at(word2_letter_index)
  end

  word1_letters.empty? && word2_letters.empty?
end

## O(n ** 2)

#
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true
# p second_anagram?("elvis", "livesll")    #=> false

def third_anagram?(word1, word2)
  word1_letters = word1.split("")
  word1_letters.sort!

  word2_letters = word2.split("")
  word2_letters.sort!

  word1_letters == word2_letters
end
## O(n * log(n))

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true




def fourth_anagram?(word1, word2)
  word1_hash = Hash.new(0)
  word2_hash = Hash.new(0)

  word1.each_char { |letter| word1_hash[letter] += 1 }
  word2.each_char { |letter| word2_hash[letter] += 1 }

  word1_hash == word2_hash
end

## O(n)

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def bonus_anagram?(word1, word2)
  letter_hash = Hash.new(0)

  word1.each_char { |letter| letter_hash[letter] += 1 }
  word2.each_char { |letter| letter_hash[letter] -= 1 }

  letter_hash.all? { |letter, value| value == 0 }
end

## O(n)

p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
p bonus_anagram?("hell", "heoo")    #=> false
