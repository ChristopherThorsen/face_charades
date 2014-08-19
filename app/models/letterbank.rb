class Letterbank
  ALPHABET = %w{a a a b c d e e e f g h i i i j k l m n  o o o p q r s t u u u v  w x y z}
  LETTERS_TO_ADD = 3

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
    LETTERS_TO_ADD.times do
      @letterbank << ALPHABET.sample
    end
  end
end
