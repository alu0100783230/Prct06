class Nutrition_Info
  attr_reader :Hidrates, :Proteins, :Fats, :Calories

  def initialize(hidrates, proteins, fats, calories)
    @Hidrates = check_great_zero hidrates
    @Proteins = check_great_zero proteins
    @Fats = check_great_zero fats
    @Calories = check_great_zero calories
  end

  def check_great_zero(param)
    if (param < 0)
      0
    else
      param
    end
  end

  def to_s
    "hidrates: " + @Hidrates.to_s + ", proteins: " + @Proteins.to_s + ", fats: " + @Fats.to_s + ", kilocalories: " + @Calories.to_s
  end
end
