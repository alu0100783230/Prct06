require "spec_helper"

describe Prct06 do

  before :all do
    @menu = Menu.new
  end

  it "has a version number" do
    expect(Prct06::VERSION).not_to be nil
  end

  it "a title must exist" do
    expect(@menu.Title).not_to eq(nil)
  end
end
