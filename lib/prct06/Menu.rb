class Menu
  attr_reader :Title, :Porcentage

  def initialize(title, porcentage)
    @Title = check_name title
    @Porcentage = check_porcentage porcentage
  end

  def check_name(title)
    posible_names = ["Desayuno", "Almuerzo", "Cena", "Media Mañana", "Merienda"]
    posible_names.each do |x|
      if (x == title)
        return title
      end
    end
    "Desayuno"
  end

  def check_porcentage(porcentage)
    if (porcentage > 0)
      porcentage
    else
      10
    end
  end

end
