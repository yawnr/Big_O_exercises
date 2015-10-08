def first_anagram?(word1, word2)
  word1_grams = word1.split("").permutation.to_a.map(&:join)

  word1_grams.include?(word2)
end
#

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


p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p second_anagram?("elvis", "livesll")    #=> false
