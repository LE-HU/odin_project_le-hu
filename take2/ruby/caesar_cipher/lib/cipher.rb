input_string = "some text i'd like to cipher, even with UPPERCASE"

def cipher(text, shift)
  encoded_text = ""
  text.each_char do |letter|
    encoded_text << (((letter.ord + shift - 97) % 26) + 97).chr if letter.match(/[a-z]/)
    encoded_text << (((letter.ord + shift - 65) % 26) + 65).chr if letter.match(/[A-Z]/)
    encoded_text << letter if letter.match(/\W/)
  end
  encoded_text
end

puts cipher(input_string, 3)
