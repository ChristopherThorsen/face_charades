class Letterbank
  TOTAL_LETTERS = 12
  ALPHABET = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}

  def initialize(prompt)
    @letterbank = []
    @prompt = prompt
  end

  def generate
    add_letters_in_prompt_to_letterbank
    add_filler_letters_to_letterbank
    @letterbank.shuffle
  end

  def add_letters_in_prompt_to_letterbank
    letters_in_prompt = @prompt.split('')
    letters_in_prompt.each do |letter|
      @letterbank << letter
    end
  end

  def add_filler_letters_to_letterbank
    letters_to_add = TOTAL_LETTERS - @prompt.length
    letters_to_add.times do
      @letterbank << ALPHABET.sample
    end
  end
end
