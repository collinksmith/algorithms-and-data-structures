=begin
Using the Ruby language, have the function CountingMinutes(str) take the str parameter being passed which will be two times (each properly formatted with a colon and am or pm) separated by a hyphen and return the total number of minutes between the two times. The time will be in a 12 hour clock format. For example: if str is 9:00am-10:00am then the output should be 60. If str is 1:00pm-11:00am the output should be 1320. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def counting_minutes(str)
  times = str.split('-')
  hours = []
  minutes = []
  times.each do |time|
    if time[-2..-1].downcase == 'pm'
      hours << (time.match(/(\d+).+/)[1]).to_i + 12
    elsif time[-2..-1].downcase == 'am'
      hours << time.match(/(\d+).+/)[1].to_i
    end

    minutes << time.match(/\d+\:(\d+).+/)[1].to_i
  end

  time1 = hours[0] * 60 + minutes[0]
  time2 = hours[1] * 60 + minutes[1]


  if time2 > time1
    difference = time2 - time1
  else  
    difference = (time2 + (60 * 24)) - time1
  end
  
  difference
end

p counting_minutes("9:00am-10:00am")
p counting_minutes("1:00pm-11:00am")