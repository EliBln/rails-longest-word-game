

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
    return
  end

    def score
      @word = params[:word].upcase
      @letters = params[:letters]
      @result = if word_in_grid? && in_english?
        "#{@word} is valid !"
      elsif word_in_grid?
        "#{@word} does not exist in english !"
      else
        "#{@word} is not valid !"
      end
    end

    def word_in_grid?
        return false if @letters.nil? || @word.nil?

        @word.chars.all? do |letter|
          @word.count(letter) <= @letters.count(letter)
        end
      end


    def in_english?
      url = "https://dictionary.lewagon.com/#{@word}"
      JSON.parse(URI.open(url).read)['found']
    end

end
