input_string = "some TEXT I'd like to cipher, ok?"
input_string2 = "SoMeTeXt"

def cipher(text, shift)
  encoded_text = ""
  text.each_char do |letter|
    encoded_text << (((letter.ord + shift - 97) % 26) + 97).chr if letter.match(/[a-z]/)
    encoded_text << (((letter.ord + shift - 65) % 26) + 65).chr if letter.match(/[A-Z]/)
    encoded_text << letter if letter.match(/\W/)
    encoded_text << letter if letter.match(/\d/)
  end
  encoded_text
end

puts cipher(input_string, 5)
puts cipher(input_string2, 8)
