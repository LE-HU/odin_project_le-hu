require "./lib/cipher"

describe "Cipher" do
  describe "#cipher" do
    it "encodes alpha characters by given shift" do
      input_string = "some TEXT I'd like to cipher, ok?"
      encoded = "xtrj YJCY N'i qnpj yt hnumjw, tp?"
      expect(cipher(input_string, 5)).to eql(encoded)
    end

    it "does not encode whitespaces" do
      encoded = "    \t\n"
      expect(cipher("    \t\n", 10)).to eql(encoded)
    end

    it "does not encode non-alphabetic characters" do
      encoded = "!,.;'/[]12345"
      expect(cipher("!,.;'/[]12345", 9)).to eql(encoded)
    end

    it "encodes letters with UPPERCASE, lowercase persistence" do
      input_string = "SoMeTeXt"
      encoded = "AwUmBmFb"
      expect(cipher(input_string, 8)).to eql(encoded)
    end

    it "does wrap around lowercase ASCII table ex. z+5 == e" do
      input_string = "z"
      encoded = "e"
      expect(cipher(input_string, 5)).to eql(encoded)
    end

    it "does wrap around uppercase ASCII table ex. Z+5 == E" do
      input_string = "Z"
      encoded = "E"
      expect(cipher(input_string, 5)).to eql(encoded)
    end
  end
end
