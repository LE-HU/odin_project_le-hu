dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit", "pojeb"]

def subfun(text = "", compare = "")
  substrings_found = {}

  for word in text.split(" ")
    for subword in compare
      if word.include? subword
        substrings_found[subword] ||= 0
        substrings_found[subword] += 1
      else
        next
      end
    end
  end

  return substrings_found
end

print subfun("co tam kurwie below down system pojeby down down", dictionary)
