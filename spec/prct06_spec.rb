require "spec_helper"

describe Prct06 do

  before :all do
    @menu_good_1 = Menu.new "Desayuno", 30
    @menu_good_2 = Menu.new "Almuerzo", 30
    @menu_good_3 = Menu.new "Cena", 20
    @menu_good_4 = Menu.new "Media Mañana", 10
    @menu_good_5 = Menu.new "Merienda", 10

    @menu_fail = Menu.new "Anything", 0
  end

  it "has a version number" do
    expect(Prct06::VERSION).not_to be nil
  end

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

  it "It has a porcentage" do
    expect(@menu_good_1.Porcentage).to eq(30)
    expect(@menu_good_2.Porcentage).to eq(30)
    expect(@menu_good_3.Porcentage).to eq(20)
    expect(@menu_good_4.Porcentage).to eq(10)
    expect(@menu_good_5.Porcentage).to eq(10)
  end

  it "The porcentage must be greater than 0" do
    expect(@menu_fail.Porcentage).to eq(10)
  end



end
