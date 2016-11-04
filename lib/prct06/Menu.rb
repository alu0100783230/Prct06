class Menu
  attr_reader :Title, :Porcentage, :Content, :vct

  def initialize(title, porcentage, content)
    @Title = check_name title
    @Porcentage = check_porcentage porcentage
    @Content = check_content content
    @vct = get_vct
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
      content = [Plate.new("Croqueta","1",20,Nutrition_Info.new(10, 15, 20, 25))]
    else
      content.map! do |x|
        if(!x.kind_of?(Plate))
          Plate.new("Croqueta","1",20,Nutrition_Info.new(10, 15, 20, 25))
        else
          x
        end
      end
    end
    content
  end

  def get_vct
    vct = 0
    @Content.each do |x|
      vct +=  x.NutritionalInfo.Calories
    end
    vct
  end

end
