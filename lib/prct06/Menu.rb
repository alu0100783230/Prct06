class Menu
  attr_reader :Title

  def initialize(title)
    if (check_name(title))
      @Title = title
    else
      @Title = "Desayuno"
    end
  end

  def check_name(title)
    posible_names = ["Desayuno", "Almuerzo", "Cena", "Media Mañana", "Merienda"]
    posible_names.each do |x|
      if (x == title)
        return true
      end
    end
    false
  end

end
