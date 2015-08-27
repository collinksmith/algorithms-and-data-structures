=begin
Using the Ruby language, have the function PatternChaser(str) take str which will be a string and return the longest pattern within the string. A pattern for this challenge will be defined as: if at least 2 or more adjacent characters within the string repeat at least twice. So for example "aabecaa" contains the pattern aa, on the other hand "abbbaac" doesn't contain any pattern. Your program should return yes/no pattern/null. So if str were "aabejiabkfabed" the output should be yes abe. If str were "123224" the output should return no null. The string may either contain all characters (a through z only), integers, or both. But the parameter will always be a string type. The maximum length for the string being passed in will be 20 characters. If a string for example is "aa2bbbaacbbb" the pattern is "bbb" and not "aa". You must always return the longest pattern possible. 
=end

def pattern_chaser(str)
  repeats = []
  patterns = get_patterns(str)
  

  (0...str.length).each do |i|
    ((i+1)...str.length).each do |j|
      temp = str[i..j]
      
      patterns.each do |pattern|
        if temp == pattern[0] && i > pattern[1]
          repeats << temp
        end
      end
    end
  end

  if repeats.empty?
    "no null"
  else
    repeats = repeats.sort_by { |element| element.length}
    "yes #{repeats[-1]}"
  end
end

def get_patterns(str)
  result = []

  mid = str.length / 2

  (0...mid).each do |i|
    ((i+1)...mid).each do |j|
      result << [str[i..j], j]
    end
  end

  result
end

p pattern_chaser("aabecaa")
p pattern_chaser("abbbaac")
p pattern_chaser("aabejiabkfabed")
p pattern_chaser("123224")
p pattern_chaser("aa2bbbaacbbb")
