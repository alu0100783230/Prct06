require "spec_helper"

describe Prct06 do

  before :all do
    @menu_good_1 = Menu.new ("Desayuno")
    @menu_good_2 = Menu.new ("Almuerzo")
    @menu_good_3 = Menu.new ("Cena")
    @menu_good_4 = Menu.new ("Media Mañana")
    @menu_good_5 = Menu.new ("Merienda")

    @menu_fail = Menu.new ("Anything")
  end

  it "has a version number" do
    expect(Prct06::VERSION).not_to be nil
  end

  it "The title must be on of these" do
    expect(@menu_good_1.Title).to eq("Desayuno")
    expect(@menu_good_2.Title).to eq("Almuerzo")
    expect(@menu_good_3.Title).to eq("Cena")
    expect(@menu_good_4.Title).to eq("Media Mañana")
    expect(@menu_good_5.Title).to eq("Merienda")
  end

  it "The title can't be anything" do
    expect(@menu.Title).to eq("Desayuno")
  end

end
