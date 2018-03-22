=begin
Using the Ruby language, have the function FibonacciChecker(num) return the string yes if the number given is part of the Fibonacci sequence. This sequence is defined by: Fn = Fn-1 + Fn-2, which means to find Fn you add the previous two numbers up. The first two numbers are 0 and 1, then comes 1, 2, 3, 5 etc. If num is not in the Fibonacci sequence, return the string no. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def fibonacci_checker(num)
  i = 1
  while true
    return 'yes' if fibonacci(i) == num
    return 'no' if fibonacci(i) > num    

    i += 1
  end
end

def fibonacci(num)
  return 0 if num == 1
  return 1 if num == 2
  fibonacci(num-1) + fibonacci(num-2)
end

p fibonacci_checker(8)
p fibonacci_checker(9)