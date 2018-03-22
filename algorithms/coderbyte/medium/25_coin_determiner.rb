=begin
Using the Ruby language, have the function CoinDeterminer(num) take the input, which will be an integer ranging from 1 to 250, and return an integer output that will specify the least number of coins, that when added, equal the input integer. Coins are based on a system as follows: there are coins representing the integers 1, 5, 7, 9, and 11. So for example: if num is 16, then the output should be 2 because you can achieve the number 16 with the coins 9 and 7. If num is 25, then the output should be 3 because you can achieve 25 with either 11, 9, and 5 coins or with 9, 9, and 7 coins. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def coin_determiner(num)
  coins_needed = {1 => 1,
                  2 => 2,
                  3 => 3,
                  4 => 4,
                  5 => 1,
                  6 => 2,
                  7 => 1,
                  8 => 2,
                  9 => 1,
                  10 => 2,
                  11 => 1}

  if num < 12
    return coins_needed[num]
  elsif num.between?(14, 15)
    1 + coin_determiner(num-9)
  else
    1 + coin_determiner(num-11)
  end 
end

p coin_determiner(16)
p coin_determiner(25)
