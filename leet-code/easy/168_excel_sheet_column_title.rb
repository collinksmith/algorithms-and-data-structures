=begin
Title: Excel Sheet Column Title
Difficulty: Easy
Percent correct: 17.7%

Given a positive integer, return its corresponding column title as appear in an Excel sheet.

For example:

    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB
=end

def excel_column(n)
  result = ''
  first_char = (((n - 1) % 26) + 'A'.ord).chr
  second_char = (((n / 26) - 1) + 'A'.ord).chr

  if n > 0 && n <= 26
    result << first_char
  elsif n <= (26 * 26)
    result << second_char
    result << first_char
  else
    return -1
  end

  result
end

p excel_column(26)