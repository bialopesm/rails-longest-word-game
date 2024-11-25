class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].split(',')
    @score = 0

    # Check if the word is valid
    if valid_word?(@word, @letters)
      @score = @word.length
    else
      @error_message = "The word doesn't exist."
    end
  end

  private

  # Verify if the word is valid
  def valid_word?(word, letters)
    # Verify if the letters are in the word
    word.chars.all? { |letter| letters.count(letter) >= word.count(letter) }
  end
end
