def truckin(num_trucks, range, traveled=0):
    traveled +=  float(range) / num_trucks
    num_trucks -= 1
    if num_trucks == 0:
        return traveled
    else:
        return truckin(num_trucks, range, traveled)

print truckin(50, 100)