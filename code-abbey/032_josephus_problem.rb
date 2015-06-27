=begin
Josephus Problem

Here is the classical programming puzzle though it came from ancient times when there are no computers at all. You can
see that practicing math and logic can sometimes save one's life!

About 2000 years ago there was some war, and during one of its battles defendants were blocked by attackers in the cave.

To avoid capture they decided to stand in a circle and kill each third until only one person remains - who was supposed
to commit suicide - though he eventually prefer to surrender to enemies. The problem is called after this person -
you may read the full story of Josephus and get math explanation of the problem in wikipedia article.

Your task is to determine for given number of people N and constant step K the position of a person who remains the
last - i.e. the safe position. For example if there are 10 people and they eliminate each third:

N = 10, K = 3


sequence of counting looks like this (brackets show persons who are elimintated):

1st round: 1 2 (3) 4 5 (6) 7 8 (9) 10
2nd round:                            1 (2) 4 5 (7) 8 10
3rd round:                                                (1) 4 5 (8) 10
4th round:                                                               4 (5) 10
5th round:                                                                        4 (10)


so the "winner" is one who was #4 at initial standing.

Input data will contain number of people N and the counting step K.
Answer should contain the number of person who will remain at t
=end

def josephus(n, k)
  array = []
  1.upto(n) do |i|
    array << i
  end

  count = 1
  while array.length > 1
    temp_array = []
    (0...array.length).each do |i|
      temp_array << array[i] unless count % k == 0
      count += 1
    end
 
    array = temp_array
  end

  array[0]
end

p josephus(10, 3)