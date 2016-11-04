require "prct06/Nutrition_Info.rb"

class Plate
  attr_reader :Name, :Quantity, :Extra, :NutritionalInfo

  def initialize(name, extra, quantity, nutr_info)
    @Name = name
    @Extra = extra
    @Quantity = check_quantity quantity
    @NutritionalInfo = nutr_info
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
