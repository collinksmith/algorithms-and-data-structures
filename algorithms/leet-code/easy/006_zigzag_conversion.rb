=begin
Title: ZigZag Conversion
Difficulty: Easy
Percent correct: 22.4%

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R


And then read line by line: "PAHNAPLSIIGYIR"


Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);

convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
  Show Tags          String
=end

def string_convert(text, nRows)
  result = ''
  rows = Hash.new

  index_count = 0
  while index_count < text.length
    1.upto(nRows) do |row_number|
      break unless index_count < text.length

      if rows[row_number]
        rows[row_number] << text[index_count]
      else
        rows[row_number] = text[index_count]
      end
      index_count += 1
    end

    (nRows-1).downto(2) do |row_number|
      break unless index_count < text.length

      rows[row_number] << text[index_count]
      index_count += 1
    end
  end
  
  1.upto(nRows) do |row_number|
    result << rows[row_number]
  end

  result
end

p string_convert("PAYPALISHIRING", 3)