=begin
Using the Ruby language, have the function OverlappingRectangles(strArr) read the strArr parameter being passed which will represent two rectangles on a Cartesian coordinate plane and will contain 8 coordinates with the first 4 making up rectangle 1 and the last 4 making up rectange 2. It will be in the following format: ["(0,0),(2,2),(2,0),(0,2),(1,0),(1,2),(6,0),(6,2)"] Your program should determine the area of the space where the two rectangles overlap, and then output the number of times this overlapping region can fit into the first rectangle. For the above example, the overlapping region makes up a rectangle of area 2, and the first rectangle (the first 4 coordinates) makes up a rectangle of area 4, so your program should output 2. The coordinates will all be integers. If there's no overlap between the two rectangles return 0. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def overlapping_rectangles(strArr)
  # Convert recangles to the format: "[[0,0],[2,2],[2,0],[0,2],[1,0],[1,2],[6,0],[6,2]]"
  rectangles = rect_converter(strArr)

  first_rect = get_corners(rectangles[0..3])
  second_rect = get_corners(rectangles[4..7])

  overlapping_rect = get_overlapping_rectangle(first_rect, second_rect)

  rect_area(first_rect) / rect_area(overlapping_rect)
end

def get_corners(arr)
  min_x, max_x, min_y, max_y = nil, nil, nil, nil

  arr.each do |coords|
    x = coords[0]
    y = coords[1]

    if min_x.nil? || x < min_x
      min_x = x
    end
    if max_x.nil? || x > max_x
      max_x = x
    end
    if min_y.nil? || y < min_y
      min_y = y
    end
    if max_y.nil? || y > max_y
      max_y = y
    end
  end

  [[min_x, min_y], [max_x, max_y]]
end

def get_overlapping_rectangle(rect1, rect2)
  rect1_mins, rect2_mins = rect1[0], rect2[0]
  rect1_maxes, rect2_maxes = rect1[1], rect2[1]

  x_min = [rect1_mins[0], rect2_mins[0]].max
  y_min = [rect1_mins[1], rect2_mins[1]].max
  x_max = [rect1_maxes[0], rect2_maxes[0]].min
  y_max = [rect1_maxes[1], rect1_maxes[1]].min

  [[x_min, y_min], [x_max, y_max]]
end

def rect_area(rect)
  length = rect[1][0] - rect[0][0]
  width = rect[1][1] - rect[0][1]
  length * width
end

def rect_converter(strArr)
  strArr = strArr.to_s.gsub('(', '')
  strArr = strArr.split('),')

  result  = []
  strArr.each do |coords|
    result << [coords[0].to_i, coords[-1].to_i]
  end

  result
end

p overlapping_rectangles(["(0,0),(2,2),(2,0),(0,2),(1,0),(1,2),(6,0),(6,2)"])