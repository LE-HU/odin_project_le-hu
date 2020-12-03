require './lib/calculator'

describe Calculator do
  describe "#add" do
    it "sums two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
    it "sums any number of numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2, 7)).to eql(14)
    end
  end

  describe "#subtract" do
    it "subtracts two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(5,2)).to eql(3)
    end
    it "subtracts any number of numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(5, 2, 2)).to eql(1)
    end
  end

  describe "#multiply" do
    it "multiplies two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(5,2)).to eql(10)
    end
    it "multiplies any number of numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(5, 2, 2)).to eql(20)
    end
  end

  describe "#divide" do
    it "divides two numbers" do
      calculator = Calculator.new
      expect(calculator.divide(5,2)).to eql(2)
    end
    it "divides any number of numbers" do
      calculator = Calculator.new
      expect(calculator.divide(5, 2, 2)).to eql(1)
    end
  end

end

