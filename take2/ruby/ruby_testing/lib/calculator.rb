class Calculator
  def add(*args)
    args.sum
  end

  def subtract(*args)
    args.reduce(:-)
  end
end
