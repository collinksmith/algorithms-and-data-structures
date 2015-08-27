# These methods are part of the solution to the third and final problem of chapter 2
# Specifically, the sub-problem: "Reading a number with three or four digits"

# Multiplying each digit by the correct power of ten based on the
# discovered length of the string
def read_digits(number)
  result = 0
  digits = []

  idx1 = 0
  while idx1 < number.length
    digits << (number[idx1].ord - '0'.ord)

    idx1 += 1
  end

  idx2 = 0
  while idx2 < digits.length
    result += digits[idx2] * (10 ** (idx1 - 1))

    idx1 -= 1
    idx2 += 1
  end

  result
end

# Multiplying the entire result by 10 each time you discover another digit
def read_digits2(number)
  result = number[0].ord - '0'.ord

  idx1 = 1
  while idx1 < number.length
    result = result * 10 + (number[idx1].ord - '0'.ord)

    idx1 += 1
  end

  result
end

p read_digits('883')
p read_digits2('87142')