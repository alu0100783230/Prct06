class Plate
  attr_reader :Name, :Quantity, :Extra

  def initialize(name, extra, quantity)
    @Name = name
    @Extra = extra
    @Quantity = check_quantity quantity
  end

  def check_quantity(quantity)
    if (quantity > 0)
      quantity
    else
      1
    end
  end

  def to_s
    @Name + ", " + @Extra + ", " + @Quantity.to_s + " g"
  end

end
