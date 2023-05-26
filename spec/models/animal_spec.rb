require_relative '../requests/rails_helper'
require_relative '../requests/spec_helper'

RSpec.describe Animal, type: :model do
  describe "all" do
    it "should return all the animal records" do
      animals = Animal.all
      expect(animals.size).to eq(5)
      expect(animals[0].common_name).to eq("Wolf")
      expect(animals[0].scientific_binomial).to eq("Canis lupus")

      expect(animals[1].common_name).to eq("Rabbit")
      expect(animals[1].scientific_binomial).to eq("Oryctolagus cuniculus")

      expect(animals[2].common_name).to eq("Black Bear")
      expect(animals[2].scientific_binomial).to eq("Ursus americanus")

      expect(animals[3].common_name).to eq("Giraffe")
      expect(animals[3].scientific_binomial).to eq("Giraffa camelopardalis")

      expect(animals[4].common_name).to eq("Macaw")
      expect(animals[4].scientific_binomial).to eq("Psittacidae")
    end
  end
end