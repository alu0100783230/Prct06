require "spec_helper"

describe Prct06 do

  before :all do
    @nutritional_good_1 = Nutrition_Info.new 10, 15, 20, 25
    @nutritional_fail_1 = Nutrition_Info.new -1, -5, 20, 25

    @plate_good_1 = Plate.new "name", "extra_info", 3, @nutritional_good_1
    @plate_good_2 = Plate.new "Macarrones con salsa de tomate y queso parmesano", "1 1/2 cucharón",  200, @nutritional_good_1

    @plate_fail_1 = Plate.new "name", "extra_info", 0, @nutritional_good_1
    @plate_fail_2 = Plate.new "name", "extra_info", -5, @nutritional_good_1

    @menu_good_1 = Menu.new "Desayuno", 30, [@plate_good_1, @plate_good_2]
    @menu_good_2 = Menu.new "Almuerzo", 30, [@plate_good_1, @plate_good_2]
    @menu_good_3 = Menu.new "Cena", 20, [@plate_good_1, @plate_good_2]
    @menu_good_4 = Menu.new "Media Mañana", 10, [@plate_good_1, @plate_good_2]
    @menu_good_5 = Menu.new "Merienda", 10, [@plate_good_1, @plate_good_2]

    @menu_fail_1 = Menu.new "Anything", 0, ["hola", @plate_good_1]
    @menu_fail_2 = Menu.new "Anything", -5, []
  end

  it "has a version number" do
    expect(Prct06::VERSION).not_to be nil
  end

  describe "Nutrition" do
    describe "contains information" do
      it "have hidrates" do
        expect(@nutritional_good_1.Hidrates).to eq(10)
        expect(@nutritional_fail_1.Hidrates).to eq(0)
      end
      it "have proteins" do
        expect(@nutritional_good_1.Proteins).to eq(15)
        expect(@nutritional_fail_1.Proteins).to eq(0)
      end
      it "have fats" do
        expect(@nutritional_good_1.Fats).to eq(20)
      end
      it "have calories" do
        expect(@nutritional_good_1.Calories).to eq(25)
      end
    end

    it "have a formated output" do
      expect(@nutritional_good_1.to_s).to eq("hidrates: 10, proteins: 15, fats: 20, kilocalories: 25")
    end
  end

  describe "Plate" do
    it "have title" do
      expect(@plate_good_1.Name).to eq("name")
    end
    it "have extra info" do
      expect(@plate_good_1.Extra).to eq("extra_info")
    end

    describe "quantity" do
      it "have quantity" do
        expect(@plate_good_1.Quantity).to eq(3)
      end
      it "cuantity can't be 0" do
        expect(@plate_fail_1.Quantity).to eq(1)
        expect(@plate_fail_2.Quantity).to eq(1)
      end
    end

    it "have a formated output" do
      expect(@plate_good_2.to_s).to eq("Macarrones con salsa de tomate y queso parmesano, 1 1/2 cucharón, 200 g")
    end

    it "have nutritional information" do
      expect(@plate_good_2.NutritionalInfo).to eq(@nutritional_good_1)
    end

  end

  describe "Menu" do

    describe "title" do
      it "The title must be on of these" do
        expect(@menu_good_1.Title).to eq("Desayuno")
        expect(@menu_good_2.Title).to eq("Almuerzo")
        expect(@menu_good_3.Title).to eq("Cena")
        expect(@menu_good_4.Title).to eq("Media Mañana")
        expect(@menu_good_5.Title).to eq("Merienda")
      end

      it "The title can't be anything" do
        expect(@menu_fail_1.Title).to eq("Desayuno")
        expect(@menu_fail_2.Title).to eq("Desayuno")
      end
    end

    describe "porcentage" do
      it "It has a porcentage" do
        expect(@menu_good_1.Porcentage).to eq(30)
        expect(@menu_good_2.Porcentage).to eq(30)
        expect(@menu_good_3.Porcentage).to eq(20)
        expect(@menu_good_4.Porcentage).to eq(10)
        expect(@menu_good_5.Porcentage).to eq(10)
      end

      it "The porcentage must be greater than 0" do
        expect(@menu_fail_1.Porcentage).to eq(10)
        expect(@menu_fail_2.Porcentage).to eq(10)
      end
    end

    describe "content" do
      it "contains plates" do
        expect(@menu_good_1.Content).to be_a(Array)
        expect(@menu_good_1.Content).not_to be_empty
        expect(@menu_good_1.Content[0]).to eq(@plate_good_1)
        expect(@menu_good_1.Content[1]).to eq(@plate_good_2)
      end

      it "possible errors are fixed" do
        expect(@menu_fail_1.Content[0]).to be_a(Plate)
        expect(@menu_fail_1.Content[1]).to be_a(Plate)
      end
    end

    describe "have nutritional info" do
      it "have V.C.T" do
        expect(@menu_good_1.get_vct()).to eq(50)
      end
      it "have hidrates" do
        expect(@menu_good_1.get_hidrates()).to eq(20)
      end
      it "have proteins" do
        expect(@menu_good_1.get_proteins()).to eq(30)
      end
      it "have fats" do
        expect(@menu_good_1.get_fats()).to eq(40)
      end
    end

  end

end
