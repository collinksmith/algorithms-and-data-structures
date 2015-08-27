=begin
Title: Climbing Stairs
Difficulty: Easy
Percent correct: 34.1%

You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
  Show Tags          Dynamic Programming
=end

def climbing_stairs(n)
  return 1 if n == 1
  return 2 if n == 2
  climbing_stairs(n-1) + climbing_stairs(n-2)
end

p climbing_stairs(3)
p climbing_stairs(4)
p climbing_stairs(5)