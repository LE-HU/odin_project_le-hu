#lib/calculator.rb

class Calculator
  def add(*args)
    args.reduce { |acc, num| acc + num }
  end

  def subtract(*args)
    args.reduce { |acc, num| acc - num }
  end
end
