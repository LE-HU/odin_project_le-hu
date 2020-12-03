class Calculator
  def add(*args)
    args.sum
  end

  def subtract(*args)
    args.reduce(:-)
  end

  def multiply(*args)
    args.reduce(:*)
  end

  def divide(*args)
    args.reduce(:/)
  end
end
