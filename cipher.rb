entry_string = "abc ABC, ?! xyz XYZ some STRing omg"

def cipher(string, shift = 1)
  alphabet = Array("a".."z")
  print alphabet.zip(alphabet.rotate(shift))
  non_caps = Hash[alphabet.zip(alphabet.rotate(shift))]
  print non_caps

  alphabet = Array("A".."Z")
  caps = Hash[alphabet.zip(alphabet.rotate(shift))]

  encrypter = non_caps.merge(caps)

  return string.chars.map { |c| encrypter.fetch(c, c) }.join
end

puts cipher(entry_string, 1)
# puts cipher(entry_string, 5)
# puts cipher(entry_string, 20)
