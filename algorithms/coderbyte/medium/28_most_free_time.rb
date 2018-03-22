=begin
Using the Ruby language, have the function MostFreeTime(strArr) read the strArr parameter being passed which will represent a full day and will be filled with events that span from time X to time Y in the day. The format of each event will be hh:mmAM/PM-hh:mmAM/PM. For example, strArr may be ["10:00AM-12:30PM","02:00PM-02:45PM","09:10AM-09:50AM"]. Your program will have to output the longest amount of free time available between the start of your first event and the end of your last event in the format: hh:mm. The start event should be the earliest event in the day and the latest event should be the latest event in the day. The output for the previous input would therefore be 01:30 (with the earliest event in the day starting at 09:10AM and the latest event ending at 02:45PM). The input will contain at least 3 events and the events may be out of order. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def most_free_time(strArr)
  start_times = []
  end_times = []

  strArr.each do |event|
    times = event.split('-')
    start_times << time_to_minutes(times[0])
    end_times << time_to_minutes(times[1])
  end

  start_times.sort!
  end_times.sort!

  open_periods = []
  0.upto(start_times.length-2) do |i|
    open_periods << start_times[i+1] - end_times[i]
  end

  minutes_to_time(open_periods.max)
end

# Convert time of format 'HH:MMAM' to absolute time in minutes
def time_to_minutes(str)
  result = 0
  data = str.match(/(\d+):(\d+)(\w+)/)
  hours = data[1].to_i
  minutes = data[2].to_i
  period = data[3].upcase

  if period == 'PM' && hours != 12
    hours += 12
  elsif period == 'AM' && hours == 12
    hours = 0
  end

  result += (hours * 60) + minutes
end

def minutes_to_time(num)
  hours = num / 60
  minutes = num % 60

  result = ''
  if hours.to_s.length == 1
    result << "0#{hours.to_s}:"
  else
    result << "#{hours.to_s}:"
  end
  result << minutes.to_s
end

p most_free_time(["10:00AM-12:30PM","02:00PM-02:45PM","09:10AM-09:50AM"])