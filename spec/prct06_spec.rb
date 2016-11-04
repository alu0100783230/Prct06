require "spec_helper"

describe Prct06 do

  before :all do
    @menu_good_1 = Menu.new "Desayuno", 30
    @menu_good_2 = Menu.new "Almuerzo", 30
    @menu_good_3 = Menu.new "Cena", 20
    @menu_good_4 = Menu.new "Media Mañana", 10
    @menu_good_5 = Menu.new "Merienda", 10

    @menu_fail_1 = Menu.new "Anything", 0
    @menu_fail_2 = Menu.new "Anything", -5

    @plate_good = Plate.new "name", "extra_info", 3

    @plate_fail_1 = Plate.new "name", "extra_info", 0
    @plate_fail_2 = Plate.new "name", "extra_info", -5
  end

  it "has a version number" do
    expect(Prct06::VERSION).not_to be nil
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
        expect(@menu_fail.Title).to eq("Desayuno")
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

  end

  describe "Plate" do

    it "have title" do
      expect(@plate_good.Name).to eq("name")
    end
    it "have extra info" do
      expect(@plate_good.Name).to eq("extra_info")
    end

    describe "quantity" do
      it "have quantity" do
        expect(@plate_good.Name).to eq(4)
      end
      it "cuantity can't be 0" do
        expect(@plate_fail_1.Name).to eq(1)
        expect(@plate_fail_2.Name).to eq(1)
      end
    end

  end




end
