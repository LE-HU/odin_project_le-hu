class Factorial
  def factorial_of(n)
    (1..n).inject(:*)
  end
end

describe Factorial do
  it "finds the factorial of 5" do
    expect(subject.factorial_of(5)).to eq(120)
  end
end
