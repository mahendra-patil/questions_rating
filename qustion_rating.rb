class Rating
 
  QUESTIONNAIRE = [
    "Have you relocated to Pune?",
    "Do you have experience in JS?",
    "Do you have AWS skill?"
  ]

  def initialize
    @questions= QUESTIONNAIRE
    @responses=[]
  end

  def call
    @responses << QUESTIONNAIRE.map do |question|
      print "#{question}: "
      gets.chomp
    end
    result
  end

  def result
     # Calculate current rating
    current_rating = calculate_rating(@responses.last)
    puts "Rating for this run: #{current_rating}"

    # Calculate average rating for all runs
    average_rating = @responses.map { |run| calculate_rating(run) }.sum / @responses.size
    puts "Average rating for all runs: #{average_rating}"
  end

  private

  def calculate_rating(responses)
    num_yes = responses.count { |response| response.downcase == 'yes' || response.downcase == 'y' }
    num_questions = responses.size
    rating = (num_yes.to_f / num_questions) * 100
    rating.nan? ? 0 : rating
  end
end

rating= Rating.new
rating.call