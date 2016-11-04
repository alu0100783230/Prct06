class Menu
  attr_reader :Title, :Porcentage, :Content

  def initialize(title, porcentage, content)
    @Title = check_name title
    @Porcentage = check_porcentage porcentage
    @Content = check_content content
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

  def check_content(content)
    if (!content.kind_of?(Array))
      content = [Plate.new("Croqueta","1",20,nil)]
    else
      content.map! do |x|
        if(!x.kind_of?(Plate))
          Plate.new("Croqueta","1",20,nil)
        else
          x
        end
      end
    end
    content
  end

end
