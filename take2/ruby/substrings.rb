dictionary = ["below", "down", "go", "going",
              "horn", "how", "howdy", "it",
              "i", "low", "own", "part",
              "partner", "sit"]

def substrings(word, dict)
  result = dict.reduce(Hash.new(0)) do |new_dict, dict_word|
    new_dict[dict_word] += 1 if word.include?(dict_word)
    new_dict # important to return new_dict for each iteration
  end
end

puts substrings("sit", dictionary)
puts substrings("below", dictionary)
