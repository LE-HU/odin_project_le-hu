#spec/calculator_spec.rb

require "./lib/calculator"

describe Calculator do
  describe "#add" do
    it "returns the sum of x numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2, 7)).to eql(14)
    end
  end
  describe "#subtract" do
    it "returns the result of subtraction of x numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(10, 2, 3, 1)).to eql(4)
    end
  end
end
