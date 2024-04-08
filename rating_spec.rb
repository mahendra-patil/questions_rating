# rating_spec.rb

require '/home/md/Mahendra/qustion_rating.rb'

RSpec.describe Rating do
  let(:rating) { Rating.new }

  describe "#initialize" do
    it "initializes questions and responses" do
      expect(rating.instance_variable_get(:@questions)).to eq Rating::QUESTIONNAIRE
      expect(rating.instance_variable_get(:@responses)).to eq []
    end
  end

  describe "#calculate_rating" do
    it "calculates rating correctly" do
      responses = ["yes", "no", "yes"]
      expect(rating.send(:calculate_rating, responses)).to eq 66.66666666666666
    end

    it "Returns 100 rating" do
      responses = ["yes", "yes", "yes"]
      expect(rating.send(:calculate_rating, responses)).to eq 100.00
    end

    it "return o rating" do
      responses = ["no", "no", "no"]
      expect(rating.send(:calculate_rating, responses)).to eq 0.0
    end

    it "return o rating for no answers" do
      responses = ["n", "n", "n"]
      expect(rating.send(:calculate_rating, responses)).to eq 0.0
    end
  end
end
