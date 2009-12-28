# # http://projecteuler.net/index.php?section=problems&id=17
# 
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, 
# how many letters would be used?
# 
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" 
# when writing out numbers is in compliance with British usage.

class NumberAsWord
  attr_accessor :sum, :num_as_word
  def initialize(min, max)
    @range = (min..max)
    @sum = 0
    @num_as_word = num_as_word
    @current_num 
    @tmp_num
    (@range).each do |n|
      @current_num = n
      build_words(@current_num)
    end
  end
  
  # Set variables
  def sum=(set_sum)
    @sum = set_sum
  end
  def num_as_word=(set_num_as_word)
    num_as_word = set_num_as_word
  end
  
  def gen_single(num)
    n_s = num.to_s
    #  could this be a hash table?
    if n_s =~ /^1/ then num = "one"    
    elsif n_s =~ /^2/ then num = "two"
    elsif n_s =~ /^3/ then num = "three"
    elsif n_s =~ /^4/ then num = "four"  
    elsif n_s =~ /^5/ then num = "five"
    elsif n_s =~ /^6/ then num = "six"  
    elsif n_s =~ /^7/ then num = "seven"
    elsif n_s =~ /^8/ then num = "eight"
    elsif n_s =~ /^9/ then num = "nine"
    else
      num = ""     
    end
    @num_as_word = num
  end
  
  def convert_single_digit
    # get the second digit
      p "converting the single digit"
      n_s = @current_num.to_s
      n_s = n_s[-1,1] # gets last digit
      @tmp_num = n_s.to_i
      p "that single digit is: " + n_s.to_s
      # convert it using gen_single
      gen_single(@tmp_num)
      # if poo ends in "t", cut off the t
      if @num_as_word =~ /t/
        @num_as_word = @num_as_word.chop
      end

  end
  
  def gen_duple(num)
    # p "duple num: " + @current_num.to_s
    #  p "@ current_num : " + @current_num.to_s
    if @current_num === 10 then @num_as_word = "ten"
    elsif @current_num === 11 then @num_as_word = "eleven"
    elsif @current_num === 12 then @num_as_word = "twelve"
    elsif @current_num === 13 then @num_as_word = "thirteen"
    elsif @current_num === 14 then @num_as_word = "fourteen"
    elsif @current_num === 15 then @num_as_word = "fifteen"
    elsif @current_num >= 16 && @current_num < 20
      convert_single_digit
      p @current_num
      @num_as_word = @num_as_word.to_s + "teen"  
    elsif num >= 20 && num < 30
      convert_single_digit
      @num_as_word = "twenty" + @num_as_word.to_s
    end
    p "our number as a word: " + @num_as_word.to_s
  end
  
  def gen_triple
    
  end
  
  def add_this_shit_up
    eng_len = @num_as_word.to_s.length
    @sum += eng_len
  end
  
  def build_words(num)
    num_len = num.to_s.length
    # p num_len
    if num_len == 1 then gen_single(@current_num)
    elsif num_len == 2 then gen_duple(@current_num)
    elsif num_len == 3 then gen_triple
    else
      p "poo!"  
    end
    add_this_shit_up
  end
end

solution = NumberAsWord.new(1, 29)

p "our solution is " + solution.sum.to_s