require "spec_helper"

describe Prct06 do

  before :all do
    @title = "desayuno media manana almuerzo merienda cena"

    @menu = Menu.new (@title)
  end

  it "has a version number" do
    expect(Prct06::VERSION).not_to be nil
  end

  it "a title must exist" do
    expect(@menu.Title).to eq(@title)
  end
end
