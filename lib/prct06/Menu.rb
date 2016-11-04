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
    var = 0
    @Content.each do |x|
      var +=  x.NutritionalInfo.Calories
    end
    var
  end

  def get_fats
    var = 0
    @Content.each do |x|
      var +=  x.NutritionalInfo.Fats
    end
    var
  end

  def get_hidrates
    var = 0
    @Content.each do |x|
      var +=  x.NutritionalInfo.Hidrates
    end
    var
  end

  def get_proteins
    var = 0
    @Content.each do |x|
      var +=  x.NutritionalInfo.Proteins
    end
    var
  end

  def to_s
    s = @Title + " (#{@Porcentage}%)\n"
    @Content.each do |x|
      s += "- " + x.to_s + "\n"

    end
    s += "V.C.T | % #{get_vct} kcal | #{get_hidrates}% | #{get_proteins}% | #{get_fats}%"
  end

end
