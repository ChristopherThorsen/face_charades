class Card < ActiveRecord::Base
  def hidden_answer
    number_of_letters = prompt.length
    "_ " * number_of_letters
  end
end
